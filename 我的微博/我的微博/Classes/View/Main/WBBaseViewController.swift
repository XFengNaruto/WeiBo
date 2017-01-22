//
//  WBBaseViewController.swift
//  我的微博
//
//  Created by  XFengNaruto on 2017/1/21.
//  Copyright © 2017年  XFengNaruto. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    //自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))

    //自定义导航条目
    lazy var navItem = UINavigationItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }

}

/// MARK 设置界面
extension WBBaseViewController {
    
    func setupUI () {
        view.backgroundColor = UIColor.cz_random()
        
        //添加自定义的导航条
        view.addSubview(navigationBar)
        //将item添加到 bar
        navigationBar.items = [navItem]
        //设置渲染
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.darkGray]
    }
}
