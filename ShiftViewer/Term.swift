//
//  Term.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/26.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Term {
    enum Group: Int {
        case Shibuya = 1
        case Umeda = 4
        
        func toStr() -> String {
            switch self {
            case .Shibuya: return "渋谷"
            case .Umeda: return "梅田"
            }
        }
    }
    
    enum InitError: ErrorType {
        case Unparsable(String)
        case UnknownGroup
        case Unconvertable(String)
    }
    
    var id: Int
    var group: Group
    var startDate: String
    var finishDate: String
    
    init(id: Int, group: Group, start: String, finish: String) {
        self.id = id
        self.group = group
        startDate = start
        finishDate = finish
    }
    
    static func from(json: JSON) throws -> Term {
        guard let id = json["id"].int else {
            throw InitError.Unparsable("id")
        }
        
        guard let groupId = json["mentor_shift_group_id"].int else {
            throw InitError.Unparsable("group id")
        }
        
        guard let group = Group.init(rawValue: groupId) else {
            throw InitError.UnknownGroup
        }
        
        guard let HyphtnSeparatedStartDate = json["start_date"].string else {
            throw InitError.Unparsable("start date")
        }
        
        guard let start = NSDate.convert(HyphtnSeparatedStartDate) else {
            throw InitError.Unconvertable("start date")
        }
        
        guard let HyphtnSeparatedFinishDate = json["finish_date"].string else {
            throw InitError.Unparsable("finish date")
        }
        
        guard let finish = NSDate.convert(HyphtnSeparatedFinishDate) else {
            throw InitError.Unconvertable("finish date")
        }
        
        return self.init(id: id, group: group, start: start, finish: finish)
    }
}