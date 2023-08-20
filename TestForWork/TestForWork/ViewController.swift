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
        // 使用示例
        let viewToObserve = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        main.view = viewToObserve
        let observer = FrameObserver(view: viewToObserve)

        // 修改view的frame，触发监听
        viewToObserve.frame = CGRect(x: 0, y: 0, width: 150, height: 150)

    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("viewWillTransition")
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
extension UIViewController: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}


