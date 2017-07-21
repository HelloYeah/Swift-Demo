//
//  PageViewController.swift
//  SegmentBar
//
//  Created by Sekorm on 2017/7/21.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        self.view.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
