//
//  first.swift
//  navigation
//
//  Created by ByteDance on 2023/8/9.
//


import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "first page"
        self.view.backgroundColor = .brown
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "next page", style: .plain, target: self, action: #selector(self.nextPage))
        // Do any additional setup after loading the view.
    }
    @objc func nextPage() {
        let viewController = SecondViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    deinit {
        print( "first view controller was deinit")
    }

}
