//
//  WebViewController.swift
//  Entertainment
//
//  Created by 吕君 on 2020/5/18.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//
import UIKit
import WebKit

class WebViewController: BaseViewController {

    private var url = ""
    
    private lazy var webview: WKWebView = {
        return WKWebView()
    }()
    
    private lazy var progress: UIProgressView = {
        let progress = UIProgressView()
        progress.tintColor = .blue
        progress.trackTintColor = .white
        return progress
    }()
    
    private var progressObserver: Any?
    
    init(url: String = "", title: String) {
        super.init(nibName: nil, bundle: nil)
        self.url = url
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBack()
        setupViews()
        setupConstraints()
        
        if url.isIncludeChineseIn() {
            url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? url
        }
        
        guard let url = URL(string: url) else { return }
        webview.load(URLRequest(url: url))
        progressKVO()
    }

}

private extension WebViewController {
    func setupViews() {
        view.addSubview(webview)
        view.addSubview(progress)
    }
    
    func setupConstraints() {
        
        webview.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        progress.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(2)
        }
    }
}

private extension WebViewController {
    func progressKVO() {
        // progress kvo
        progressObserver = webview.observe(\.estimatedProgress, options: .new) { [weak self] (webView, _) in
            self?.progress.alpha = 1
            self?.progress.setProgress(Float(webView.estimatedProgress), animated: true)
            
            guard webView.estimatedProgress >= 1.0 else { return }
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
                self?.progress.alpha = 0
                }, completion: { [weak self] (_) in
                    self?.progress.setProgress(0, animated: false)
            })
        }
    }
}
