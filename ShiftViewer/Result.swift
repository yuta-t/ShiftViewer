//
//  Result.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/10/06.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import Foundation

enum Result<T, Error: ErrorType> {
    case Success(T)
    case Failure(Error)
}
