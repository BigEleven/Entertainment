//
//  TabBarController.swift
//  Entertainment
//
//  Created by tt on 2019/6/26.
//  Copyright © 2019 eleven. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        
        addChild(BaseViewController(), "image")
        addChild(BaseViewController(), "image")
        addChild(BaseViewController(), "image")
        addChild(BaseViewController(), "image")
    }
    
    
    private func addChild(_ childController: UIViewController, _ icon: String) {
        childController.tabBarItem.image = UIImage(named: icon)
        childController.tabBarItem.selectedImage = UIImage(named: icon + "_select")
//        childController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: (iPhoneXAbove ? -18 : -7), right: 0)
        let vc = NavigationController(rootViewController: childController)
        addChild(vc)
    }
}
