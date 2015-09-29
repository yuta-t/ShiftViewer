//
//  ShiftListModel.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/28.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol ShiftListModelDelegate: class {
    func showErrorAlert(message: String)
}

enum GettingTermError: ErrorType {
    case InvalidJsonObject
    case CouldntCastToJsonObject
    case UnknownKey(key: String)
    case CouldntCastToTermAttribute(key: String)
    case UnknownGroupID
    case CouldntConvertToNSDate(key: String)
}

class ShiftListModel: NSObject, UITableViewDataSource {
    weak var delegate: ShiftListModelDelegate?
    var terms = [Term]()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return terms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        let term = terms[indexPath.row]
        let group = term.group.toStr()
        let startDate = term.startDate
        let finishDate = term.finishDate
        cell.textLabel?.text = "\(group)拠点: \(startDate)〜\(finishDate)"
        return cell
    }
    
    
    func getTerms(completed: () -> Void) {
        let url = "http://localhost:3000/api/mentor_shifts/mentor_shift_terms"
        WebAPI.jsonObject(url) { (jsonObject) in
            defer { completed() }
            
            do {
                try self.validateGettingTerm(jsonObject)

                for dic in jsonObject as! [[String: AnyObject]] {
                    self.terms.append(Term(dic: dic))
                }
                
            } catch GettingTermError.InvalidJsonObject {
                self.delegate?.showErrorAlert("Invalid JSON object")
            } catch GettingTermError.CouldntCastToJsonObject {
                self.delegate?.showErrorAlert("Couldn't cast to JSON object")
            } catch GettingTermError.UnknownKey(let key) {
                self.delegate?.showErrorAlert("Unknown key '\(key)'")
            } catch GettingTermError.CouldntCastToTermAttribute(let key) {
                self.delegate?.showErrorAlert("Couldn't cast to term attribute '\(key)'")
            } catch GettingTermError.UnknownGroupID {
                self.delegate?.showErrorAlert("Unknown group id")
            } catch GettingTermError.CouldntConvertToNSDate(let key) {
                self.delegate?.showErrorAlert("Couldn't convert to NSDate '\(key)'")
            } catch {
                self.delegate?.showErrorAlert("Unknown error")
            }
        }
    }
    
    func validateGettingTerm(jsonObject: AnyObject?) throws {
        guard let json = jsonObject else {
            throw GettingTermError.InvalidJsonObject
        }
        
        guard let terms = json as? [[String: AnyObject]] else {
            throw GettingTermError.CouldntCastToJsonObject
        }
        
        for dic in terms {
            let keys = [["id", "mentor_shift_group_id"], ["start_date", "finish_date"]]
            for key in keys.flatten() {
                guard let value = dic[key] else {
                    throw GettingTermError.UnknownKey(key: key)
                }
                
                if keys[0].contains(key) {
                    guard let intValue = value as? Int else {
                        throw GettingTermError.CouldntCastToTermAttribute(key: key)
                    }
                    
                    if key == "mentor_shift_group_id" {
                        guard let _ = Term.Group(rawValue: intValue) else {
                            throw GettingTermError.UnknownGroupID
                        }
                    }
                } else {
                    guard let strValue = value as? String else {
                        throw GettingTermError.CouldntCastToTermAttribute(key: key)
                    }
                    
                    guard let _ = NSDate.convertFromHyphenSeparatedDate(strValue) else {
                        throw GettingTermError.CouldntConvertToNSDate(key: key)
                    }
                }
                
            }
        }
    }
    
}

