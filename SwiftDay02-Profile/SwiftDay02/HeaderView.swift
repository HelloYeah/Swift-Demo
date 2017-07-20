//
//  HeaderView.swift
//  SwiftDay02
//
//  Created by Sekorm on 2017/7/20.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit
import SnapKit

class HeaderView: UIView {

    lazy var nameLabel = UILabel()
    lazy var compnyLabel = UILabel()
    lazy var bgImageView = UIImageView()
    lazy var headerImageView = UIImageView()
    lazy var headerBorderView = UIView()
    lazy var settingBtn: UIButton = {
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.setImage(UIImage.init(named: "Setting"), for: .normal)
        btn.bounds.size = CGSize.init(width: 35, height: 35)
        return btn
    }()
    
    let scale = ScreenW / kTableHeaderViewHeight
    override init(frame: CGRect) {
        
        super.init(frame: frame)

        self.addSubview(bgImageView)
        bgImageView.image = UIImage.init(named: "LOL")
        bgImageView.snp.makeConstraints { (make) in
            make.size.equalToSuperview()

        }

        self.addSubview(compnyLabel)
        compnyLabel.text = "某某某公司"
        compnyLabel.sizeToFit()
        compnyLabel.textColor = UIColor.white
        compnyLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(ScreenW * 0.5)
            make.bottom.equalToSuperview().offset(-25)
        }
        
        self.addSubview(nameLabel)
        nameLabel.text = "Hello world!"
        nameLabel.sizeToFit()
        nameLabel.textColor = UIColor.white
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(ScreenW * 0.5)
            make.bottom.equalTo(compnyLabel.snp.top).offset(-8)
        }
        
        
        self.addSubview(headerBorderView)
        headerBorderView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 88, height: 88))
            make.center.equalToSuperview()
        }
        

        headerBorderView.layer.cornerRadius = 44
        headerBorderView.layer.masksToBounds = true
        
        self.addSubview(headerImageView)
        headerImageView.image = UIImage.init(named: "lion")
        headerImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 80, height: 80))
            make.center.equalToSuperview()
        }
        headerImageView.layer.cornerRadius = 40
        headerImageView.layer.masksToBounds = true
        
        self.addSubview(settingBtn)
        settingBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-20)
        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        bgImageView.frame.size.width = self.bounds.height * scale
        bgImageView.center = CGPoint.init(x: self.bounds.width * 0.5, y: self.bounds.height * 0.5)
        
        let alphe = (self.bounds.height - kTableHeaderViewHeight) / kTableHeaderViewHeight + 0.3
        headerBorderView.backgroundColor = UIColor.init(white: 1, alpha: alphe)
    }
}
