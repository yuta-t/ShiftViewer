//
//  UserSettingView.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/29.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit

class UserSettingView: UIView {
    var xibView: UIView
    
    required init() {
        xibView = UINib(nibName: "UserSettingView", bundle: nil).instantiateWithOwner(nil, options: nil).first as! UIView
        
        super.init(frame: CGRectZero)
        addSubview(xibView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.whiteColor()
    }
    
}
