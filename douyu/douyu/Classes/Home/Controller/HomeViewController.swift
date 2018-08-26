//
//  HomeViewController.swift
//  douyu
//
//  Created by 周会勤 on 2018/8/24.
//  Copyright © 2018年 周会勤. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton()
        btn.setImage(UIImage(named: "logo"), for: UIControlState.normal)
        btn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        let size = CGSize(width: 40, height: 40)
        
        let historyBtn = UIButton()
        historyBtn.setImage(UIImage(named: "image_my_history"), for: .normal)
        historyBtn.setImage(UIImage(named: "Image_my_history_click"), for: .highlighted)
        historyBtn.frame = CGRect(origin: CGPoint.zero, size: size)
        let histotyItem = UIBarButtonItem(customView: historyBtn)
        
        let searchBtn = UIButton()
        searchBtn.setImage(UIImage(named: "btn_search"), for: .normal)
        searchBtn.setImage(UIImage(named: "btn_search_clicked"), for: .highlighted)
        searchBtn.frame = CGRect(origin: CGPoint.zero, size: size)
        let searchItem = UIBarButtonItem(customView: searchBtn)
        
        
        let qrcodeBtn = UIButton()
        qrcodeBtn.setImage(UIImage(named: "Image_scan"), for: .normal)
        qrcodeBtn.setImage(UIImage(named: "Image_scan_click"), for: .highlighted)
        qrcodeBtn.frame = CGRect(origin: CGPoint.zero, size: size)
        let qrcodeItem = UIBarButtonItem(customView: qrcodeBtn)
        navigationItem.rightBarButtonItems = [histotyItem,searchItem,qrcodeItem]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
