//
//  UserSettingViewController.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/29.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit

final class UserSettingViewController: UIViewController {
    private let model = UserSettingModel()
    
    override func loadView() {
        let nib = UINib(nibName: "UserSettingView", bundle: nil)
        view = nib.instantiateWithOwner(nil, options: nil).first as! UIView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ユーザー設定"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "戻る", style: .Plain, target: self, action: "backToShiftList:")
    }

    
    func backToShiftList(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

