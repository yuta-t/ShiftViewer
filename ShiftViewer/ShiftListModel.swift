//
//  ShiftListModel.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/28.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit
import SwiftyJSON

protocol ShiftListModelDelegate: class {
    func showErrorAlert(message: String)
}

final class ShiftListModel: NSObject, UITableViewDataSource {
    var terms = [Term]()
    weak var delegate: ShiftListModelDelegate?
    
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
        self.terms = []
        
        let url = "http://localhost:3000/api/mentor_shifts/mentor_shift_terms"
        WebAPI.jsonObject(url) { (result) in
            guard let jsonTerms = result else {
                self.delegate?.showErrorAlert("Could not connect to server")
                return
            }
            
            for jsonTerm in JSON(jsonTerms) {
                do {
                    let term = try Term(json: jsonTerm.1)
                    self.terms.append(term)
                    completed()
                    
                } catch Term.InitError.Unparsable(let string) {
                    self.delegate?.showErrorAlert("Could not parse \(string)")
                } catch Term.InitError.UnknownGroup {
                    self.delegate?.showErrorAlert("Unknown group")
                } catch Term.InitError.Unconvertable(let string) {
                    self.delegate?.showErrorAlert("Could not convert \(string)")
                } catch {
                    self.delegate?.showErrorAlert("Unknown error")
                }
            }
            
        }
    }
}

