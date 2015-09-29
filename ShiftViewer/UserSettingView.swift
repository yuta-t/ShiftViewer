//
//  UserSettingView.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/29.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit

class UserSettingView: UIView {
    let familyNameTextField: UITextField
    let firstNameTextField: UITextField
    let clearButton: UIButton
    let submitButton: UIButton
    
    required init() {
        familyNameTextField = UITextField(frame: CGRectZero)
        firstNameTextField = UITextField(frame: CGRectZero)
        clearButton = UIButton(frame: CGRectZero)
        submitButton = UIButton(frame: CGRectZero)
        
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
