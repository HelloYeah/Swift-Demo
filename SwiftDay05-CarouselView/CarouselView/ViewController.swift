//
//  ViewController.swift
//  CarouselView
//
//  Created by Sekorm on 2017/7/21.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var carouselView: CarouselView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        carouselView.images = ["0","1","2"]
    }
}

