//
//  UserSettingView.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/29.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit

final class UserSettingView: UIView {
    private let model = UserSettingModel()
    
    @IBOutlet weak var familyNameTextField: FamilyNameTextField!
    @IBOutlet weak var firstNameTextField: FirstNameTextField!
    @IBOutlet weak var sendButton: SendButton!
    
    override func awakeFromNib() {
        let (familyName, firstName) = model.fetchName()
        familyNameTextField.text = familyName
        firstNameTextField.text = firstName
    }
}
