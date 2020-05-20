//
//  ChildViewController.swift
//  Entertainment
//
//  Created by tt on 2019/7/2.
//  Copyright © 2019 eleven. All rights reserved.
//

import UIKit

extension UIViewController {
    func addComponentViewController(_ viewController: UIViewController) {
        addComponentViewController(viewController, at: view)
    }
    
    func addComponentViewController(_ viewController: UIViewController, at containerView: UIView) {
        addChild(viewController)
        containerView.addSubview(viewController.view)
        var frame = containerView.bounds
        frame.origin = CGPoint(x: 0, y: 0)
        viewController.view.frame = frame
        viewController.didMove(toParent: self)
    }
    
    func removeComponented() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}

