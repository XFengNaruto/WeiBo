//
//  WBHomeViewController.swift
//  我的微博
//
//  Created by  XFengNaruto on 2017/1/21.
//  Copyright © 2017年  XFengNaruto. All rights reserved.
//

import UIKit

fileprivate let cellId = "cellId"

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    fileprivate lazy var statusList = [String]()
    
    override func loadData() {
        print("开始加载数据")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            for i in 0..<20 {
                self.statusList.insert(i.description, at: 0)
            }
            print("刷新表格数据")
            //结束刷新控件
            self.refreshControl?.endRefreshing()
            self.tableView?.reloadData()
            
        }
        
        
    }
    
    /// 显示好友
    @objc fileprivate func showFriends () {
        let vc = WBDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

/// 表格数据源方法
extension WBHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = statusList[indexPath.row]
        return cell
    }
}


/// MARK 设置界面
extension WBHomeViewController {
    
    override func setupUI() {
        super.setupUI()
        
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriends))
        
        //注册原型Cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showFriends))
    }
    
}
