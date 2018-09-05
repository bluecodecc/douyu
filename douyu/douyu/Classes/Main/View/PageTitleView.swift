//
//  pageTitleView.swift
//  douyu
//
//  Created by 周会勤 on 2018/8/26.
//  Copyright © 2018年 周会勤. All rights reserved.
//

import UIKit

protocol PageTitleViewDelegate : class {
    func pageTitleView(TitleView: PageTitleView, selectedIndex index : Int)
}

private let kScrollLineH: CGFloat = 2
private let KNormalColor: (CGFloat,CGFloat,CGFloat) = (85,85,85)
private let KSelectColor: (CGFloat,CGFloat,CGFloat) = (255,128,0 )

class PageTitleView: UIView {
    
    private var currentIndex: Int = 0
    private var titles: [String]
    
    weak var delegate: PageTitleViewDelegate?
    
    private lazy var titleLabels: [UILabel] = [UILabel]()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces  = false
        return scrollView
    }()
    private lazy var scrollLine: UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    init(frame:CGRect, titles:[String]) {
        self.titles = titles
        super.init(frame:frame)
        
        //设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PageTitleView {
    private func setupUI() {
        //1.设置UIScrollView(子视图)
        scrollView.frame = bounds
        addSubview(scrollView)
        //2.添加title
        setupTitleLabels()
        //3.设置底线和滚动滑块
        setupButtonMenuAndScrollLine()
    }
    
    private func setupTitleLabels() {
        let labelW: CGFloat = frame.width / CGFloat(titles.count)
        let labelH: CGFloat = frame.height - CGFloat(kScrollLineH)
        let labelY: CGFloat = 0
        for (index, title) in titles.enumerated() {
            //1.创建label
            let label = UILabel()
            //2.设置属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor(r: KNormalColor.0, g: KNormalColor.1, b: KNormalColor.2)
            label.textAlignment = .center
            //3.设置frame
            let labelX: CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            //4.将label添加到scrollView
            scrollView.addSubview(label)
            titleLabels.append(label)
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick))
            label.addGestureRecognizer(tapGes)
        }
    }
    private func setupButtonMenuAndScrollLine() {
        //1.创建底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height-lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor(r: KSelectColor.0, g: KSelectColor.1, b: KSelectColor.2)
        scrollView.addSubview(scrollLine)
        
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
}

extension PageTitleView {
    @objc private func titleLabelClick(tapGes: UITapGestureRecognizer) {
        //1.获取当前label下标值
        guard let currentLabel = tapGes.view as? UILabel else {return}
        
        //2.获取之前的label
        let oldLabel = titleLabels[currentIndex]
        
        //3.切换文字颜色
        currentLabel.textColor = UIColor(r: KSelectColor.0, g: KSelectColor.1, b: KSelectColor.2)
        oldLabel.textColor = UIColor(r: KNormalColor.0, g: KNormalColor.1, b: KNormalColor.2)
        
        //4.更新currentIndex
        currentIndex = currentLabel.tag
        
        //5.
        let scrollLineX = CGFloat(currentLabel.tag) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15, animations: {
            self.scrollLine.frame.origin.x = scrollLineX
        })
        
        //通知代理
        delegate?.pageTitleView(TitleView: self, selectedIndex: currentIndex)
    }
}
extension PageTitleView {
    func setTitleWithProgress(progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
        
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        let colorDetal = (KSelectColor.0 - KNormalColor.0,KSelectColor.1 - KNormalColor.1,KSelectColor.2 - KNormalColor.2)
        
        sourceLabel.textColor = UIColor(r: KSelectColor.0 - colorDetal.0 * progress, g: KSelectColor.1 - colorDetal.1 * progress, b: KSelectColor.2 - colorDetal.2 * progress)
        targetLabel.textColor = UIColor(r: KNormalColor.0 + colorDetal.0 * progress, g: KNormalColor.1 + colorDetal.1 * progress, b: KNormalColor.2 + colorDetal.2 * progress)
    }
}
