//
//  WBVisitorView.swift
//  我的微博
//
//  Created by  XFengNaruto on 2017/1/22.
//  Copyright © 2017年  XFengNaruto. All rights reserved.
//

import UIKit

// 访客视图
class WBVisitorView: UIView {

    override init(frame : CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK 私有控件
    //图像视图
    private lazy var iconView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    //小房子
    private lazy var hourseIconView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    //提示标签
    private lazy var tipLabel : UILabel = UILabel.cz_label(withText: "关注一些人，回这里看看有什么惊喜关注一些人，回这里看看", fontSize: 14, color: UIColor.darkGray)
    //注册按钮
    private lazy var registerBtn : UIButton = UIButton.cz_textButton("注册", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    //登录按钮
    private lazy var loginBtn : UIButton = UIButton.cz_textButton("登录", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
}

extension WBVisitorView {
    
    func setupUI () {
        backgroundColor = UIColor.white
    }
}
