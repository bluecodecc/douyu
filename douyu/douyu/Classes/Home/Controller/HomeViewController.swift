//
//  HomeViewController.swift
//  douyu
//
//  Created by 周会勤 on 2018/8/24.
//  Copyright © 2018年 周会勤. All rights reserved.
//

import UIKit

private let KTitleViewH: CGFloat = 40

class HomeViewController: UIViewController {
    
    private lazy var pageTitleView : PageTitleView = {[weak self] in
       let titleFrame = CGRect(x: 0, y: kStatusBarH+KNavigationBarH, width: KScreenW, height: KTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView  = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    private lazy var pageContentView: PageContentView = {[weak self] in
        let contentH = KScreenH - kStatusBarH - KNavigationBarH - KTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH+KNavigationBarH+KTitleViewH , width: KScreenW, height: contentH)
        var childVcs = [UIViewController]()
        for _ in 0..<4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs:childVcs, parentViewController: self)
        contentView.delegate = self
        return contentView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUI() {
        //1.设置导航栏
        setupNavigationBar()
        //2.设置TitleView
        view.addSubview(pageTitleView)
        //3.添加contentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.red
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

extension HomeViewController: PageTitleViewDelegate {
    func pageTitleView(TitleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

extension HomeViewController: PageContentViewDelegate {
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
