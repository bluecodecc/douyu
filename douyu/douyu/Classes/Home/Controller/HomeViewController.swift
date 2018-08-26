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
        setupNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        let size = CGSize(width: 40, height: 40)
        let histotyItem = UIBarButtonItem(imageName: "image_my_history", hightImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", hightImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", hightImageName: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [histotyItem,searchItem,qrcodeItem]
    }

}
