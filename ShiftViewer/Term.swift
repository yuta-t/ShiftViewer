//
//  Term.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/26.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import Foundation

struct Term {
    enum Group: Int {
        case Shibuya = 1, Umeda
        
        func toStr() -> String {
            switch self {
            case .Shibuya: return "渋谷"
            case .Umeda: return "梅田"
            }
        }
    }
    
    var id: Int
    var group: Group
    var startDate: String
    var finishDate: String
    
    init(dic: [String: AnyObject]) {
        self.id = dic["id"] as! Int
        self.group =  Group(rawValue: (dic["mentor_shift_group_id"] as! Int))!
    
        let startDate = NSDate.convertFromHyphenSeparatedDate(dic["start_date"] as! String)
        self.startDate = startDate.convertToSlashSeparatedDate()

        let finishDate =  NSDate.convertFromHyphenSeparatedDate(dic["finish_date"] as! String)
        self.finishDate = finishDate.convertToSlashSeparatedDate()
    }
}
