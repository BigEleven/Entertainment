//
//  TableView.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/9/24.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import UIKit

class TableView: UITableView {
   
    init<T: TableViewCell>(register cell: T.Type, target: Any, _ style: UITableView.Style = .plain) {
        super.init(frame: CGRect.zero, style: style)
        delegate(target)
        register(cellType: cell)
        rowHeight = UITableView.automaticDimension
        tableFooterView = UIView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
