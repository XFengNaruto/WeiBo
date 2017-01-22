//
//  WBDemoViewController.swift
//  我的微博
//
//  Created by  XFengNaruto on 2017/1/22.
//  Copyright © 2017年  XFengNaruto. All rights reserved.
//

import UIKit

class WBDemoViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置标题
        title = "第\(navigationController?.childViewControllers.count ?? 0)个"
    }
    @objc fileprivate func showNext() {
        let vc = WBDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension WBDemoViewController{
    
    override func setupUI() {
        super.setupUI()
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", target: self, action: #selector(showNext))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", style: .plain, target: self, action: #selector(showNext))
    }
}
