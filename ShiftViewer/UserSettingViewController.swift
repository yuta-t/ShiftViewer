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
        let userSettingView = view as! UserSettingView
        
        title = "ユーザー設定"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "戻る", style: .Plain, target: self, action: "backToShiftList:")
        
        userSettingView.sendButton.addTarget(self, action: "sendButtonDidClick:", forControlEvents: .TouchUpInside)
    }

    
    
    func backToShiftList(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func sendButtonDidClick(sender: UIButton) {
        let userSettingView = view as! UserSettingView
        let familyName = userSettingView.familyNameTextField.text!
        let firstName = userSettingView.firstNameTextField.text!
        
        switch model.validate(familyName: familyName, firstName: firstName) {
        case .Success:
            model.save(familyName: familyName, firstName: firstName)
            backToShiftList(self)
        case .Failure(let message):
            showCautionAlert(message)
        }
    }
    
    func showCautionAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)

        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

