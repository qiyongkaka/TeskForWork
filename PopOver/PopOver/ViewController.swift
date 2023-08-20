//
//  ViewController.swift
//  PopOver
//
//  Created by ByteDance on 2023/8/4.
//

import UIKit

class ViewController: UIViewController {
    
    // 创建目标UIView
    let targetView = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置目标UIView的属性和样式
        targetView.backgroundColor = UIColor.red
        targetView.frame = CGRect(x: 500, y: 500, width: 100, height: 100)
        
        // 将目标UIView添加到视图控制器的视图中
        self.view.addSubview(targetView)
        targetView.addTarget(self, action: #selector(showPopover), for: .touchUpInside)
    }
    
    @objc func showPopover () {
        
        // 创建要显示的内容视图控制器
        let contentViewController = UIViewController()
        contentViewController.modalPresentationStyle = .popover
        contentViewController.view.backgroundColor = UIColor.green
        contentViewController.preferredContentSize = CGSize(width: 300, height: 300)
        
        // 初始化popover视图控制器
        let popoverController = contentViewController.popoverPresentationController
        popoverController?.sourceView = targetView // 指定popover的来源视图
        popoverController?.sourceRect = targetView.bounds // 指定popover箭头的位置
        popoverController?.permittedArrowDirections = .any // 设置箭头方向
        popoverController?.delegate = self // 设置代理
        // 显示popover
        self.present(contentViewController, animated: true, completion: nil)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    // UIPopoverPresentationControllerDelegate 的一些代理方法可以在这里实现
    // 比如popover消失时的处理等等
}

