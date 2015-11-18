//
//  NavigationController.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/28.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = UIColor.corporateRed()
        navigationBar.tintColor = UIColor.corporateWhite()
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.corporateWhite()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
