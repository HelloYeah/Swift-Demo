//
//  ViewController.swift
//  SegmentBar
//
//  Created by Sekorm on 2017/7/21.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

class ViewController: UIViewController {

    var segmentBar = SegmentBar.init(frame: CGRect.init(x: 0, y: 64, width: kScreenW, height: kScreenH - 64))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(segmentBar)
        segmentBar.pageViewInfos = [
            pageViewInfo.init(title: "精选头条", viewController: PageViewController()),
            pageViewInfo.init(title: "社会", viewController: PageViewController()),
            pageViewInfo.init(title: "体育", viewController: PageViewController()),
            pageViewInfo.init(title: "八卦", viewController: PageViewController()),
            pageViewInfo.init(title: "时尚", viewController: PageViewController()),
            pageViewInfo.init(title: "热点", viewController: PageViewController()),
            pageViewInfo.init(title: "政治", viewController: PageViewController()),
            pageViewInfo.init(title: "军事", viewController: PageViewController()),
            pageViewInfo.init(title: "财经", viewController: PageViewController()),
            pageViewInfo.init(title: "科技", viewController: PageViewController()),
            pageViewInfo.init(title: "教育", viewController: PageViewController()),
            pageViewInfo.init(title: "等等等等", viewController: PageViewController())]
    }

}

