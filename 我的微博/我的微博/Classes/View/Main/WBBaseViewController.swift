//
//  WBBaseViewController.swift
//  我的微博
//
//  Created by  XFengNaruto on 2017/1/21.
//  Copyright © 2017年  XFengNaruto. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController  {
    
    ///判断用户是否登录
    var userLogon = false
    
    /// 表格视图 如果用户没有登录 则不创建
    var tableView : UITableView?
    ///刷新控件
    var refreshControl : UIRefreshControl?
    
    //自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))

    //自定义导航条目
    lazy var navItem = UINavigationItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()

    }
    
    //加载数据
    func loadData()  {
        refreshControl?.endRefreshing()
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
        view.backgroundColor = UIColor.white
        
        //取消自动缩进
        automaticallyAdjustsScrollViewInsets = false
        
        setupNavigationBar()
        
        userLogon ? setupTableView() : setupVisitorView()
        
        
    }
    
    //设置表格视图
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
        //设置数据源和代理 然后让子类实现数据源方法
        tableView?.dataSource = self
        tableView?.delegate = self
        
        //设置内容缩进
        tableView?.contentInset = UIEdgeInsetsMake(navigationBar.bounds.height, 0, tabBarController?.tabBar.bounds.height ?? 49, 0)
        
        //设置刷新控件
        refreshControl = UIRefreshControl()
        //添加到表格视图
        tableView?.addSubview(refreshControl!)
        //设置监听方法
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    //设置访客视图
    private func setupVisitorView() {
        
        let visitorView = WBVisitorView(frame: view.bounds)
        view.insertSubview(visitorView, belowSubview: navigationBar)
        
    }
    
    private func setupNavigationBar() {
        //添加自定义的导航条
        view.addSubview(navigationBar)
        //将item添加到 bar
        navigationBar.items = [navItem]
        //设置渲染
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.darkGray]
    }
}

/// MARK 设置表格

extension WBBaseViewController : UITableViewDataSource , UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
