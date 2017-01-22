//
//  WBNavigationController.swift
//  我的微博
//
//  Created by  XFengNaruto on 2017/1/21.
//  Copyright © 2017年  XFengNaruto. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //隐藏默认的 Navigation
        navigationBar.isHidden = true
    }
    
    override func  pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        //隐藏底部导航栏 如果不是栈底控制器才需要隐藏
        if  childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            //设置返回按钮
            if let vc = viewController as? WBBaseViewController {
                
                var title = "返回"
                
                //判断控制器的级数
                if childViewControllers.count == 1 {
                    //tiitle 显示首页的标题
                    title = childViewControllers.first?.title ?? "返回"
                }
                
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popToParent)  , isBack : true)
            }
        }
        
        
        
        super.pushViewController(viewController, animated: true)
    }
    
    @objc fileprivate func popToParent() {
        popViewController(animated: true)
    }

}
