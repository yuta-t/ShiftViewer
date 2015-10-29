//
//  WebAPI.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/28.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import Foundation
import Alamofire

class WebAPI {
    class func jsonObject(url: String, completed: (AnyObject?) -> Void) {
        Alamofire.request(.GET, url)
        .authenticate(user: "tcamp", password: "master")
        .responseJSON { (_, _, result) in
            completed(result.value)
        }
    }
}

