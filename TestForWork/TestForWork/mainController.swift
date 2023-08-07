//
//  mainController.swift
//  TestForWork
//
//  Created by ByteDance on 2023/7/28.
//

import Foundation
import UIKit
import SnapKit

class mainController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .red
    }
    
    override func viewDidLoad() {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))

        // 将手势识别器添加到滑动区域视图上
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleSwipe(_ recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == .right {
            // 用户向左滑动的处理代码
            print("用户向右滑动")
        }
    }
}
