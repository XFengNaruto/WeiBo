//
//  UIBarButtonItem+Extensions.swift
//  我的微博
//
//  Created by  XFengNaruto on 2017/1/22.
//  Copyright © 2017年  XFengNaruto. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    
    /// 创建UIBarButtonItem
    convenience init(title : String , fontSize : CGFloat = 16 , target : AnyObject? , action : Selector , isBack : Bool = false) {
        let btn : UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        
        //设置返回的图片 左边加上箭头
        if isBack {
            let imageName = "navigationbar_back_withtext"
            
            btn.setImage(UIImage( named : imageName), for: .normal)
            btn.setImage(UIImage(named : imageName + "_highlighted"), for: .highlighted)
            btn.sizeToFit()
        }
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        //实例化
        self.init(customView : btn)
    }
}
