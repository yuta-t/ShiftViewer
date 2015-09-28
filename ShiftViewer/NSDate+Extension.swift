//
//  NSDate+Extension.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/28.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import Foundation

extension NSDate {
    class func convertFromHyphenSeparatedDate(string: String) -> NSDate {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date: NSDate = formatter.dateFromString(string)!
        return date
    }
    
    func convertToSlashSeparatedDate() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd"
        let string: String = formatter.stringFromDate(self)
        return string
    }

}