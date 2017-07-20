//
//  ViewController.swift
//  SwiftDay02
//
//  Created by Sekorm on 2017/7/19.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

let ScreenW = UIScreen.main.bounds.width
let ScreenH = UIScreen.main.bounds.height
let kTableHeaderViewHeight : CGFloat = 250.0

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    lazy var tableView : UITableView = {
        let tableView0 = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenW, height: ScreenH - 49.0))
        tableView0.contentInset = UIEdgeInsetsMake(kTableHeaderViewHeight, 0, 0, 0)
        tableView0.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        tableView0.delegate = self;
        tableView0.dataSource = self;
        return tableView0;
    }()
    
    lazy var profileHeaderView : HeaderView =  {
        let headerView = HeaderView.init(frame: CGRect.init(x: 0, y:-kTableHeaderViewHeight, width: ScreenW, height: kTableHeaderViewHeight))
        return headerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSubViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setUpSubViews()  {
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.barTintColor = UIColor.brown

        self.view.addSubview(tableView)
        tableView.addSubview(self.profileHeaderView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        cell.textLabel?.text = "text" + "  " + "\(indexPath.row)"
        cell.textLabel?.textColor = UIColor.lightGray
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y + kTableHeaderViewHeight
        if offsetY < 0 {
            profileHeaderView.frame = CGRect.init(x: 0, y:scrollView.contentOffset.y, width: UIScreen.main.bounds.width, height: -scrollView.contentOffset.y)
        }else {
            profileHeaderView.frame = CGRect.init(x: 0, y: -kTableHeaderViewHeight, width: UIScreen.main.bounds.width, height: kTableHeaderViewHeight)
            
        }
        
        print(profileHeaderView.frame)
        
        if scrollView.contentOffset.y >= -64 {
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }else {
            self.navigationController?.setNavigationBarHidden(true, animated: false)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

