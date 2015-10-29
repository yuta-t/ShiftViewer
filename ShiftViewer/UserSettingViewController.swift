//
//  UserSettingViewController.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/29.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit

class UserSettingViewController: UIViewController {

    override func loadView() {
        let nib = UINib(nibName: "UserSettingView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil).first as! UIView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
