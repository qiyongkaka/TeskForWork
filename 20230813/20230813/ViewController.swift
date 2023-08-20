//
//  ViewController.swift
//  20230813
//
//  Created by ByteDance on 2023/8/13.
//

import UIKit

class ViewController: UIViewController {

    let VC = YourViewController()
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
        view.addSubview(button)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
    }
    
    @objc func click() {
//        self.navigationController?.pushViewController(VC, animated: true)
        self.present(VC, animated: true)
    }
}

class YourViewController: UIViewController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        view.backgroundColor = .green
       
        let button = UIButton(frame: CGRect(x: 0, y: 400, width: 300, height: 300))
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc func click () {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if self.isBeingDismissed || self.isMovingFromParent {
            print("viewDidDisappear")
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isBeingDismissed || self.isMovingFromParent {
            print("viewWillDisappear")
        }
    }
    
//    override func willMove(toParent parent: UIViewController?) {
//        print("willMove")
//    }

    override func didMove(toParent parent: UIViewController?) {
        guard parent == nil else { return }
        print("didMove")
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print("test")
        if navigationController.isBeingDismissed || navigationController.isMovingFromParent {
            // 返回按钮点击事件
            print("点击返回按钮")
            return
        }
        if let gestureRecognizers = navigationController.view.gestureRecognizers {
                for gestureRecognizer in gestureRecognizers {
                    if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
                        let translation = panGestureRecognizer.translation(in: panGestureRecognizer.view)
                        if panGestureRecognizer.state == .ended {
                            // 左滑返回事件
                            print(translation)
                        }
                    }
                }
            }
    }
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//            print("will hide")
        }
}
