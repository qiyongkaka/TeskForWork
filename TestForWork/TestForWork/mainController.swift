//
//  mainController.swift
//  TestForWork
//
//  Created by ByteDance on 2023/7/28.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class mainController: UIViewController {
    
    let mainView = UIView()
    
    let subView = UIView()
    
    private let bag = DisposeBag()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .red
    }
    override func viewDidLoad() {
        self.view = mainView
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        // 将手势识别器添加到视图上
        let swipeAreaRect = CGRect(x: 0, y: 0, width: 20, height: UIScreen.main.bounds.height)
        let swipeAreaView = UIView(frame: swipeAreaRect)
        self.view.addSubview(swipeAreaView)

        // 将手势识别器添加到滑动区域视图上
        swipeAreaView.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleSwipe(_ recognizer: UISwipeGestureRecognizer) {
        if recognizer.direction == .right {
            // 用户向左滑动的处理代码
            print("用户向左滑动")
        }
    }


}
