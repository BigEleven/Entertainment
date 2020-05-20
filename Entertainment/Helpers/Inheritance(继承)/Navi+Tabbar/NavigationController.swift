//
//  NavigationController.swift
//  Entertainment
//
//  Created by tt on 2019/6/26.
//  Copyright © 2019 eleven. All rights reserved.
//

import UIKit
class NavigationController: UINavigationController {
    
    weak var popDelegate: UIGestureRecognizerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 白色导航栏
        // 实现UINavigationControllerDelegate代理
        delegate = self
        // 获取系统左划手势代理
        popDelegate = interactivePopGestureRecognizer?.delegate
        // 设置title属性
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.major, .font: UIFont.naviTitle]
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage(color: .theme), for: .default)
        navigationBar.shadowImage = UIImage()
    }
}

// MARK: -
// MARK: 自定义导航栏返回按钮及底部栏自动显示/消失
extension NavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 防止ui动画未生效
        if animated && UIView.areAnimationsEnabled == false {
            UIView.setAnimationsEnabled(true)
        }
        // 设置自动隐藏底部栏
        viewController.hidesBottomBarWhenPushed = (children.count > 0)
        // 设置返回键
        if children.count > 0 {
            let back = UIButton()
            back.setImage(UIImage(named: " "), for: .normal)
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: back)
        }
        
        super.pushViewController(viewController, animated: animated)
    }
}
// MARK: -
// MARK: UINavigationControllerDelegate
extension NavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController == self.viewControllers.first {
            self.interactivePopGestureRecognizer?.delegate = self.popDelegate
        } else {
            self.interactivePopGestureRecognizer?.delegate = nil
        }
    }
}
