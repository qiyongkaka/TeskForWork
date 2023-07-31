//
//  presentAnimation.swift
//  TestForWork
//
//  Created by ByteDance on 2023/7/28.
//

import Foundation
import UIKit

final class BTPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    weak var presentController: ViewController?

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    var containerView: UIView?
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromController = transitionContext.viewController(forKey: .from),
            let toController = transitionContext.viewController(forKey: .to),
            let fromView = fromController.view, let toView = toController.view
            else {
            return
        }
        
        /// 获取 屏幕、 browerVC 和 card 的宽度
        let screenWidth = UIScreen.main.bounds.width
        let browserVCwidth = screenWidth
        let cardWidth = screenWidth * 0.4
        
        /// 关闭交互
        fromView.isUserInteractionEnabled = false
        toView.isUserInteractionEnabled = false
        
        let contentView = transitionContext.containerView
        contentView.backgroundColor = .clear
        contentView.addSubview(toView)
        self.containerView = contentView
        
        contentView.frame = CGRect(x: browserVCwidth - cardWidth, y: 0, width: cardWidth, height: contentView.bounds.size.height)
        toView.frame = CGRect(x: cardWidth, y: 0, width: cardWidth, height: contentView.bounds.size.height)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.frame = CGRect(x: 0, y: 0, width: cardWidth, height: contentView.bounds.size.height)}){ completed in
            /// 开启用户交互
            fromView.isUserInteractionEnabled = true
            toView.isUserInteractionEnabled = true
            /// 动画完成提交
            transitionContext.completeTransition(completed)
        }
    }
}
