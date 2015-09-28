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
        let white = UIColor(white: 241 / 255, alpha: 1)
        navigationBar.barTintColor = UIColor(red: 227 / 255, green: 82 / 255, blue: 67 / 255, alpha: 1)
        navigationBar.translucent = true
        navigationBar.tintColor = white
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: white]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
