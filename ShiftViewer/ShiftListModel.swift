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

class ShiftListModel: NSObject, UITableViewDataSource {
    var terms = [Term]()

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return terms.count ?? 0
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
            if let terms = jsonObject {
                for dic in terms as! [[String: AnyObject]] {
                    let id = dic["id"] as! Int
                    let groupId = dic["mentor_shift_group_id"] as! Int
                    let startDate = dic["start_date"] as! String
                    let finishDate = dic["finish_date"] as! String
                    let term = Term(id: id, groupId: groupId, startDate: startDate, finishDate: finishDate)
                    self.terms.append(term)
                }
                completed()
            }
        }
    }
    
}
