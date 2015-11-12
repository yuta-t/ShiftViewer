//
//  UserSettingView.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/29.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit

class UserSettingView: UIView {
    @IBOutlet weak var familyNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        sendButton.setTitleColor(UIColor.corporateRed(), forState:.Normal)
        
        layoutTextField(familyNameTextField)
        layoutFamilyNameTextField(familyNameTextField)
        
        layoutTextField(firstNameTextField)
        layoutFirstNameTextField(firstNameTextField)
    }
    
    func layoutTextField(textField: UITextField) {
        textField.borderStyle = .None
        textField.textAlignment = .Center
        textField.textColor = UIColor.corporateGray()
        
        let border = CALayer()
        let width = CGFloat(1)
        border.borderColor = UIColor.corporateRed().CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    func layoutFamilyNameTextField(textField: UITextField) {

    }
    
    func layoutFirstNameTextField(textField: UITextField) {
        
    }
}