//
//  UserSettingView.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/29.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit

class UserSettingView: UIView {

    required init() {
        let familyNameTextField = UITextField(frame: CGRectZero)
        let firstNameTextField = UITextField(frame: CGRectZero)
        let clearButton = UIButton(frame: CGRectZero)
        let submitButton = UIButton(frame: CGRectZero)
        
        super.init(frame: CGRectZero)
        addSubview(familyNameTextField)
        addSubview(firstNameTextField)
        addSubview(clearButton)
        addSubview(submitButton)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.whiteColor()
    }
    
}
