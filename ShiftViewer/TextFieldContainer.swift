//
//  TextFieldContainer.swift
//  ShiftViewer
//
//  Created by Yuta Tadachi on 2015/11/18.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit

@IBDesignable final
class TextFieldContainer: UIView {
    // width  = 200
    // height =  44
    
    @IBInspectable var trigger: Bool = true {
        didSet {
            setup()
        }
    }
    
    private func setup() {
        let borderBottom = CALayer()
        let borderWidth: CGFloat = 1
        
        borderBottom.removeFromSuperlayer()
        borderBottom.frame = CGRectMake(0, frame.height - borderWidth, frame.width, borderWidth)
        borderBottom.backgroundColor = UIColor.corporateRed().CGColor
        layer.addSublayer(borderBottom)
    }
}