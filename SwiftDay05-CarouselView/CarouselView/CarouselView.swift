//
//  CarouselView.swift
//  CarouselView
//
//  Created by Sekorm on 2017/7/21.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

class CarouselView: UIView {

    lazy private var circleView = UIScrollView()
    lazy private var pageControl = UIPageControl()
    var images:[String] = []{
        
        didSet {
            pageControl.numberOfPages = images.count
            circleView.contentOffset = CGPoint.init(x: self.bounds.width, y: 0)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setUp()
    }

    func setUp() {
        self.addSubview(circleView)
        circleView.frame = self.bounds
        circleView.contentSize = CGSize.init(width: self.bounds.width * 3, height: 0)
        circleView.isPagingEnabled = true
        circleView.showsHorizontalScrollIndicator = false
        
        self.addSubview(pageControl)
        pageControl.center.x = self.bounds.width * 0.5
        pageControl.frame.origin.y = self.bounds.height - pageControl.bounds.height - 20
        circleView.backgroundColor = UIColor.black
        for var i in 0..<3 {
            let imageView = UIImageView.init(frame:CGRect.init(x: CGFloat(i) * self.bounds.width, y: 0, width: self.bounds.width, height: self.bounds.height))
            circleView.addSubview(imageView)
            imageView.image = UIImage(named:"\(i)")
            i += 1
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

