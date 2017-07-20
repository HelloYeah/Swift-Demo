//
//  ViewController.swift
//  SwiftDay01
//
//  Created by Sekorm on 2017/7/19.
//  Copyright © 2017年 YL. All rights reserved.
//

import UIKit

let ScreenW = UIScreen.main.bounds.width
let ScreenH = UIScreen.main.bounds.height

class ViewController: UIViewController {

    lazy var scrollView = UIScrollView.init()
    lazy var bottomView = UIView.init()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setUpSubView()
    }
    
    func setUpSubView()  {
        
        self.view.addSubview(scrollView)
        
        //初始化scrollView
        let scale : CGFloat = 75.0/89.0
        scrollView.frame = CGRect.init(x: 0, y: 0, width: ScreenW, height: ScreenW / scale)
        scrollView.contentSize = CGSize.init(width: ScreenW * 3.0, height: 0)
        
        var i = 0;
        while i < 3 {
            let imageView = UIImageView.init()
            imageView.image = UIImage.init(named: "Slide " + "\(i + 1)")
            imageView.bounds = scrollView.bounds
            imageView.frame.origin.x =  CGFloat(i) * ScreenW
            imageView.frame.origin.y = 0
            i += 1
            scrollView.addSubview(imageView)
        }
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        
        //初始化faceLogin
        self.view.addSubview(bottomView)
        bottomView.frame = CGRect.init(x: 0, y: scrollView.frame.height, width: ScreenW, height: ScreenH - scrollView.frame.height)
        
        let faceLogin = UIButton.init(type: .custom)
        bottomView.addSubview(faceLogin)
        let faceLoginW = ScreenW * 0.91
        let faceLoginH = bottomView.frame.height * 0.20
        let faceLoginX = (ScreenW - faceLoginW) * 0.5
        let faceLoginY : CGFloat = 20.0
        faceLogin.frame = CGRect.init(x: faceLoginX, y: faceLoginY, width: faceLoginW, height: faceLoginH)
        faceLogin.setBackgroundImage(UIImage.init(named: "Rectangle 2 Copy"), for: .normal)
        faceLogin.setImage(UIImage.init(named: "f"), for: .normal)
        faceLogin.setTitle("    Login with Facebook", for: .normal)
        
        //初始化gooleLogin
        let gooleLogin = UIButton.init(type: .custom)
        bottomView.addSubview(gooleLogin)
        gooleLogin.bounds = faceLogin.bounds
        let gooleLoginX = (ScreenW - faceLoginW) * 0.5
        let gooleLoginY : CGFloat = faceLogin.frame.origin.y + faceLogin.frame.height + 20.0
        gooleLogin.frame.origin.x = gooleLoginX
        gooleLogin.frame.origin.y = gooleLoginY
        gooleLogin.setBackgroundImage(UIImage.init(named: "Rectangle 2 Copy 4"), for: .normal)
        gooleLogin.setImage(UIImage.init(named: "Google"), for: .normal)
        gooleLogin.setTitle("    Login with Goole", for: .normal)
        gooleLogin.setTitleColor(UIColor.lightGray, for: .normal)
        
        
        //初始化signUp
        let signUp = UIButton.init(type: .custom)
        bottomView.addSubview(signUp)
        let signUpH : CGFloat = 30.0
        let signUpY : CGFloat = bottomView.bounds.height - signUpH - 20.0
        
        signUp.frame.size = CGSize.init(width: faceLoginW * 0.45, height: signUpH)
        signUp.center.x = ScreenW * 0.25
        signUp.frame.origin.y = signUpY
        
        signUp.setTitle("SIGN UP", for: .normal)
        signUp.setTitleColor(UIColor.lightGray, for: .normal)
        
        //添加分割线
        let seperter = UIView.init(frame: CGRect.init(x: ScreenW * 0.5, y: signUp.frame.origin.y, width: 1, height: signUp.frame.height))
        seperter.backgroundColor = .lightGray
        bottomView.addSubview(seperter)

        //初始化signIn
        let signIn = UIButton.init(type: .custom)
        bottomView.addSubview(signIn)
        
        signIn.frame.size = signUp.frame.size
        signIn.center.x = ScreenW * 0.75
        signIn.frame.origin.y = signUp.frame.origin.y
        
        signIn.setTitle("SIGN IN", for: .normal)
        signIn.setTitleColor(UIColor.orange, for: .normal)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

