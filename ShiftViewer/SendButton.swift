//
//  SendButton.swift
//  ShiftViewer
//
//  Created by Yuta Tadachi on 2015/11/18.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit

@IBDesignable final
class SendButton: UIButton {
    @IBInspectable var trigger: Bool = true {
        didSet {
            setup()
        }
    }
    
    private func setup() {
        backgroundColor = UIColor.corporateRed()
        
        let title = "SEND"
        titleLabel?.text = title
        setTitle(title, forState: .Normal)
        setTitleColor(UIColor.corporateWhite(), forState: .Normal)
        
        var font = titleLabel?.font
        font = font?.fontWithSize(18)
    }
}
