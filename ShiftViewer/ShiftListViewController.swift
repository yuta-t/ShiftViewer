//
//  ShiftListViewController.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/26.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit

final class ShiftListViewController: UIViewController, UITableViewDelegate, ShiftListModelDelegate {
    private let model = ShiftListModel()
    
    override func loadView() {
        super.loadView()
        view = ShiftListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let shiftView = view as! ShiftListView
        
        model.delegate = self
        shiftView.table.delegate = self
        shiftView.table.dataSource = model
        
        title = "シフト一覧"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "設定", style: .Plain, target: self, action: "transitToUserSetting:")
        
        model.getTerms {
            dispatch_async(dispatch_get_main_queue(), {
                shiftView.table.reloadData()
            })
        }
    }
    
    
    
    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func transitToUserSetting(sender: UIBarButtonItem) {
        performSegueWithIdentifier("ShowUserSetting", sender: self)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
