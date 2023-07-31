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
        // 将手势识别器添加到 UIView 上
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 处理单击事件的方法
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        print("View 被单击了！")
    }
}
