//
//  MainViewController.swift
//  douyu
//
//  Created by 周会勤 on 2018/8/23.
//  Copyright © 2018年 周会勤. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addchildVcs()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    private func addchildVcs() {
        let childVcNames = ["Home","Live","Follow","Profile"]
        for childVcName in childVcNames {
            let childVc = UIStoryboard(name: childVcName, bundle: nil).instantiateInitialViewController()!
            addChildViewController(childVc)
        }
        
    }
}
