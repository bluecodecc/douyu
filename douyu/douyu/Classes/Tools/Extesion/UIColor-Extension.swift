//
//  UIColor-Extension.swift
//  douyu
//
//  Created by 周会勤 on 2018/8/27.
//  Copyright © 2018年 周会勤. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
}
