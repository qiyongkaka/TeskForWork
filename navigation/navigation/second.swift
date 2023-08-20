//
//  second.swift
//  navigation
//
//  Created by ByteDance on 2023/8/9.
//



import UIKit
var pageNum = 0

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        pageNum += 1
        super.viewDidLoad()
        self.view.backgroundColor = .purple
        
        self.title = "\(pageNum) page"

        let push = UIButton(frame: CGRect(x: 40, y: 120, width: 240, height: 40))
        push.setTitle("push page", for: UIControl.State())
        push.addTarget(self, action: #selector(self.pushPage), for: .touchUpInside)
        self.view.addSubview(push)
        
        let pop = UIButton(frame: CGRect(x: 40, y: 180, width: 240, height: 40))
        pop.setTitle("pop page", for: UIControl.State())
        pop.addTarget(self, action: #selector(self.popPage), for: .touchUpInside)
        self.view.addSubview(pop)
        
        let index = UIButton(frame: CGRect(x: 40, y: 240, width: 240, height: 40))
        index.setTitle("index page", for: UIControl.State())
        index.addTarget(self, action: #selector(self.goToIndex), for: .touchUpInside)
        self.view.addSubview(index)
        
        let root = UIButton(frame: CGRect(x: 40, y: 320, width: 240, height: 40))
        root.setTitle("root page", for: UIControl.State())
        root.addTarget(self, action: #selector(self.goToRoot), for: .touchUpInside)
        self.view.addSubview(root)
        // Do any additional setup after loading the view.
    }
    @objc func pushPage() {
        let viewController = SecondViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func popPage() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func goToIndex() {
        let viewController = self.navigationController?.viewControllers[2]
        self.navigationController?.popToViewController(viewController!, animated: true)
    }
    @objc func goToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.prompt = "loading ..."
        self.navigationController?.setToolbarHidden(false, animated: false)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refreshData))
        self.navigationController?.navigationBar.barStyle = .black
    }
    @objc func refreshData(){
        print("data")
    }
    deinit {
        print( "second view controller was deinit")
    }

}
