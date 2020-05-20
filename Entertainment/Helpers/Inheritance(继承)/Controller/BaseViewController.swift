//
//  BaseViewController.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/9/19.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        return button
    }()
    
    lazy var appdele: AppDelegate = {
        return UIApplication.shared.delegate as? AppDelegate ?? AppDelegate()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bgColor(.blank)
    }
}

extension BaseViewController {
    
    func setBack(_ image: String = "back", _ left: Bool = true) {
        backButton.image(image)
        if left {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        } else {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: backButton)
        }
    }
    
    @objc func back() {
        pop()
    }
}

extension UIViewController {
    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func pop(_ animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    func present(_ viewController: UIViewController, completion: (() -> Swift.Void)? = nil) {
        present(viewController, animated: true, completion: completion)
    }
    
    func dismiss(completion: (() -> Swift.Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
}
