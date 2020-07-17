//
//  ViewController.swift
//  Entertainment
//
//  Created by 吕君 on 2020/4/21.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import UIKit
class ViewController: BaseViewController {
    
    private lazy var list: CollectionView = {
        let flowLayout = CollectionViewFlowLayout(scrollDirection: .vertical,
                                                  estimatedItemSize: CGSize(width: UIScreen.width,
                                                                            height: 45))
        
        let view = CollectionView(register: CollectionViewCell.self,
                                  target: self,
                                  collectionViewLayout: flowLayout)
        return view
    }()
    
    private lazy var tableView: TableView = {
        let table = TableView(register: TableViewCell.self, target: self, .plain)
        return table
    }()
    
    private lazy var label: Label = {
        let label = Label()
        return label.text("123").textColor(.black).font(12)
    }()
    
    private lazy var button: Button = {
        let button = Button()
        return button.text("button").textFont(.text).textColor(.random).bgColor(.random)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
        setupConstraints()
        
        let att =
            "这里是红色".attributed(color: .red, font: .title).newline
            +
            "这里是黄色".attributed(color: .yellow, font: .title).newline
            +
            "这里是蓝色".attributed(color: .blue, font: .title).newline
        button.attributedText(att)
        
        button.bk_addEventHandler({ (sender) in
            
        }, for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func setup() {
        view.addSubview(button)
    }
    
    func setupConstraints() {
        button.makeConstraints { (maker) in
            maker.center.equalToSuperview()
            maker.width.equalTo(200)
        }
    }
}
