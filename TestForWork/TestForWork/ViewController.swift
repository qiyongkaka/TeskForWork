//
//  ViewController.swift
//  TestForWork
//
//  Created by qiyongka on 2023/7/5.
//
import UIKit
import SnapKit

class ViewController: UIViewController {
    var button1 = UIButton.init(frame: CGRect(x: 500, y: 500, width: 100, height: 100))
    var button2 = UIButton.init(frame: CGRect(x: 600, y: 800, width: 100, height: 100))
    let main = mainController()
    let presentAnimation = BTPresentAnimationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        view.addSubview(button1)
        button1.backgroundColor = .black
        button1.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
        view.addSubview(button2)
        button2.backgroundColor = .black
        button2.addTarget(self, action: #selector(buttonClick2), for: .touchUpInside)
        button2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset( UIScreen.main.bounds.width * 0.55)
            make.bottom.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
        
        presentAnimation.presentController = self
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.updateLayout(size: size)
        coordinator.animate(alongsideTransition: { (context) in
                // 在旋转期间执行动画
                self.view.alpha = 0.0
            }) { (context) in
                // 在旋转结束后执行其他操作
                self.view.alpha = 1.0
                let screenWidth = size.width
                let screenHeight = size.height
                let cardWidth = size.width * 0.4
                self.updateLayout(size: size)
                print(context.containerView)
                
                self.button2.snp.remakeConstraints { make in
                    make.left.equalToSuperview().offset(size.width * 0.55)
                    make.bottom.equalToSuperview()
                    make.width.equalTo(300)
                    make.height.equalTo(300)
                }
                
                // 使用View的frame的变化可以做到 transition 的大小的控制，但是存在风险，上层的view不一定是transition
//                self.main.view.superview?.frame = CGRect(x: screenWidth - cardWidth, y: 0, width: cardWidth, height: screenHeight)
//
                
                self.presentAnimation.containerView?.frame = CGRect(x: screenWidth - cardWidth, y: 0, width: cardWidth, height: screenHeight)

            }
    }

    func updateLayout(size: CGSize) {
        // 在此处重新计算布局
            main.view.snp.remakeConstraints { make in
                make.width.equalTo(UIScreen.main.bounds.width * 0.4)
                make.height.equalTo(size.height)
                make.right.equalToSuperview()
            }

    }

    @objc func buttonClick() {
        main.modalPresentationStyle = .overCurrentContext
        main.transitioningDelegate = self
        self.present(main, animated: true)
        button1.isEnabled = false
    }
    
    @objc func buttonClick2() {
        print("click success")
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentAnimation
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
}


