//
//  NameTextField.swift
//  ShiftViewer
//
//  Created by Yuta Tadachi on 2015/11/18.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit

class NameTextField: UITextField {
    @IBInspectable var trigger: Bool = true {
        didSet {
            setup()
        }
    }
    
    private func setup() {
        borderStyle = .None
        textAlignment = .Center
        textColor = UIColor.corporateGray()
        font = font?.fontWithSize(18)
    }
}


@IBDesignable final
class FamilyNameTextField: NameTextField {
    private override func setup() {
        super.setup()
        placeholder = "FamilyName"
    }
}


@IBDesignable final
class FirstNameTextField: NameTextField {
    private override func setup() {
        super.setup()
        placeholder = "FirstName"
    }
}
