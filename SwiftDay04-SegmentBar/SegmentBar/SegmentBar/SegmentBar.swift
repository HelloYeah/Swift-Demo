//
//  SegmentBar.swift
//  SegmentBar
//
//  Created by Sekorm on 2017/7/21.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit
import SnapKit

struct pageViewInfo {
    var title:String
    var viewController:UIViewController
}

class SegmentBar: UIView,UIScrollViewDelegate{

    private lazy var topSildeView = UIScrollView()
    private lazy var contentSildeView = UIScrollView()
    private lazy var indicatorView = UIView()
    private var selectedBtn: UIButton?
    private var btnArray: [UIButton] = []
    private let gap:CGFloat = 15
    
    var pageViewInfos: [pageViewInfo]?{
    
        didSet{
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.setUp()
    }
    
    //添加子控件
    func setUp() {
        
        self.addSubview(topSildeView)
        topSildeView.showsHorizontalScrollIndicator = false
        topSildeView.bounces = false
        topSildeView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(35)
            make.top.equalTo(0)
        }
        
        topSildeView.addSubview(indicatorView)
        indicatorView.frame.size.height = 2;
        indicatorView.frame.origin.y = 33
        indicatorView.backgroundColor = UIColor.orange
        
        self.addSubview(contentSildeView)
        contentSildeView.showsHorizontalScrollIndicator = false
        contentSildeView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(35)
            make.left.equalTo(0)
        }
        contentSildeView.isPagingEnabled = true
        contentSildeView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }
    
    func changeSelected(btn: UIButton) {
        
        selectedBtn?.isSelected = false
        btn.isSelected = true
        selectedBtn = btn
        
        //滚动动画
        UIView.animate(withDuration: 0.25) {
            
            self.indicatorView.frame.size.width = btn.frame.width
            self.indicatorView.center.x = btn.frame.midX
            
            let x = kScreenW * CGFloat(self.btnArray.index(of: btn)!)
            self.contentSildeView.contentOffset = CGPoint.init(x: x, y: 0)
            
            // 计算偏移量
            var offsetX = btn.center.x - kScreenW * 0.5;
            if offsetX < 0 {
                offsetX = 0
            }
            // 获取最大滚动范围
            let maxOffsetX = self.topSildeView.contentSize.width - kScreenW
            if offsetX > maxOffsetX{
                offsetX = maxOffsetX
            }
            if self.topSildeView.contentSize.width > kScreenW {
                // 滚动标题滚动条
                self.topSildeView.contentOffset = CGPoint.init(x: offsetX, y: 0)
            }
        }

    }
    

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x / kScreenW)
        let pageView = pageViewInfos![index].viewController.view
        if  pageView?.superview == nil{
            contentSildeView.addSubview(pageView!)
            let x = CGFloat(index) * kScreenW
            pageView?.frame = CGRect.init(x: x, y: 0, width: kScreenW, height: contentSildeView.bounds.height)
            print(index)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / kScreenW)
        self.changeSelected(btn: self.btnArray[index])

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //布局顶部的标题按钮
        var totalW = gap
        for (index,pageViewInfo) in pageViewInfos!.enumerated() {
            let btn = UIButton.init(type: .custom)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            btn.setTitle(pageViewInfo.title, for: .normal)
            btn.setTitleColor(UIColor.orange, for: .selected)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.sizeToFit()
            btn.frame.origin.x = totalW
            btn.center.y = 35 * 0.5
            totalW += btn.bounds.width + gap
            btn.addTarget(self, action: #selector(changeSelected(btn:)) , for: .touchUpInside)
            topSildeView.addSubview(btn)
            btnArray.append(btn)
            if index == 0 {
                self.changeSelected(btn: btn)
                let pageView = pageViewInfos![index].viewController.view
                pageView?.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: contentSildeView.bounds.height)
                contentSildeView.addSubview(pageView!)
            }
        }
       
        //设置滚动范围
        topSildeView.contentSize = CGSize.init(width: totalW, height: 0)
        contentSildeView.contentSize = CGSize.init(width: kScreenW * CGFloat(pageViewInfos!.count), height: 0)
    }

}
