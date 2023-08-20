//
//  listen.swift
//  TestForWork
//
//  Created by ByteDance on 2023/8/10.
//

import Foundation
import UIKit

class FrameObserver: NSObject {
    private var observedView: UIView

    init(view: UIView) {
        observedView = view
        super.init()

        observedView.addObserver(self, forKeyPath: "frame", options: [.new, .old], context: nil)
    }

    deinit {
        observedView.removeObserver(self, forKeyPath: "frame")
    }

    // 监听属性变化的方法
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "frame" {
            if let newFrame = change?[.newKey] as? CGRect,
               let oldFrame = change?[.oldKey] as? CGRect,
               newFrame != oldFrame {
                // 在这里处理frame变化
                print("Frame changed: \(oldFrame) -> \(newFrame)")
            }
        }
    }
}

