//
//  ShiftListView.swift
//  ShiftViewer
//
//  Created by YutaTadachi on 2015/09/28.
//  Copyright © 2015年 yuta-t. All rights reserved.
//

import UIKit

class ShiftListView: UIView {
    // Properties
    let table: UITableView
    
    
    // Initializers
    required init() {
        table = UITableView(frame: CGRectZero, style: .Plain)
        
        super.init(frame: CGRectZero)
        addSubview(table)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Layout Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.whiteColor()
        
        table.frame = frame
    }
}
