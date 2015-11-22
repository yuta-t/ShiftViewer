//
//  UserSettingModel.swift
//  ShiftViewer
//
//  Created by Yuta Tadachi on 2015/11/18.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import Foundation

final class UserSettingModel: NSObject {
    
    func validate(familyName familyName: String, firstName: String) -> ValidateResult {
        switch (familyName.isEmpty, firstName.isEmpty) {
        case (true, true): return .Failure(message: "Family name and first name is empty")
        case (true, _): return .Failure(message: "Family name is empty")
        case (_, true): return .Failure(message: "First name is empty")
        case (_, _): return .Success
        }
    }
    
    
    func save(familyName familyName: String, firstName: String) {
        let userName = ["familyName": familyName, "firstName": firstName]
        
        let defaults = NSUserDefaults()
        defaults.setObject(userName, forKey: "UserName")
    }
    
    
    func fetchName() -> (String, String) {
        let defaults = NSUserDefaults()
        let fullName = defaults.objectForKey("UserName") as! [String: String]
        let familyName = fullName["familyName"]!
        let firstName = fullName["firstName"]!
        return (familyName, firstName)
    }
}


enum ValidateResult {
    case Success
    case Failure(message: String)
}