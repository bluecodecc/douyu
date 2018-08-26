//
//  UIBarButtonItem-Extension.swift
//  douyu
//
//  Created by 周会勤 on 2018/8/26.
//  Copyright © 2018年 周会勤. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName: String, hightImageName: String = "", size: CGSize = CGSize.zero) {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        if hightImageName != "" {
            btn.setImage(UIImage(named: hightImageName), for: .highlighted)
        }
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        self.init(customView:btn)
    }
}
