//
//  WBMainViewController.swift
//  我的微博
//
//  Created by  XFengNaruto on 2017/1/21.
//  Copyright © 2017年  XFengNaruto. All rights reserved.
//

import UIKit

//主控制器
class WBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
    }

}


//无法定属性  只能定义方法  切分代码 便于维护
extension WBMainViewController {
    
    //设置所有子控制器 比如首页 发现 消息 我
    //这里本来是 private修饰符 但是好像不起作用 这是swift3.0改进的地方
    //Swift 3必看：新的访问控制fileprivate和open
    fileprivate func setupChildControllers () {
        let array = [["clsName" : "WBHomeViewController" , "title" : "首页" , "imageName" : "home"],
                     ["clsName" : "WBMessageViewController" , "title" : "消息" , "imageName" : "message_center"],
                     ["clsName" : "WBDiscoverViewController" , "title" : "发现" , "imageName" : "discover"],
                     ["clsName" : "WBProfileViewController" , "title" : "我" , "imageName" : "profile"]]
        
        var arrayM = [UIViewController] ()
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
        
    }
    
    /// 使用字典创建一个子控制器
    private func controller(dict : [String : String]) -> UIViewController {
        
        //1 取得字典内容
        guard let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"] ,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
        else {
            return UIViewController()
        }
        
        //2 创建视图控制器
        let vc = cls.init()
        vc.title = title
        
        //3 设置图像
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        //vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        let nav = WBNavigationController(rootViewController : vc)
        
        return nav
        
    }
}
