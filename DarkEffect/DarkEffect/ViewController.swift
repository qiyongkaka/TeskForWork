//
//  ViewController.swift
//  DarkEffect
//
//  Created by ByteDance on 2023/8/18.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    var maskView = UIView()
    let contentView = UIView()
    
    func setUpForContentView() {
        
        let closeButton = UIButton()
        closeButton.backgroundColor = .red
        contentView.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(13)
            make.width.height.equalTo(24)
        }
        closeButton.addTarget(self, action: #selector(dismissGuideView), for: .touchUpInside)
        
        let headerView = UILabel()
        headerView.text = "AI 帮你智能生成字段"
        contentView.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(61)
            make.height.equalTo(28)
            make.width.equalTo(186)
            make.centerX.equalToSuperview()
        }
        
        
        let textView = UIStackView()
        contentView.addSubview(textView)
        textView.backgroundColor = .green
        textView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(121)
            make.height.equalTo(224)
            make.width.equalTo(340)
            make.centerX.equalToSuperview()
        }
        
        
        let useButton = UIButton()
        contentView.addSubview(useButton)
        useButton.backgroundColor = .green
        useButton.setTitle("立即使用", for: .normal)
        useButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(375)
            make.height.equalTo(48)
            make.width.equalTo(344)
            make.centerX.equalToSuperview()
        }
        
        let protocolInformation = UILabel()
        contentView.addSubview(protocolInformation)
        protocolInformation.numberOfLines = 0
        protocolInformation.text = "AI生成能力由第三方 AI 模型提供支持，使用 AI 生成功能即表示您同意 Notice on AI Field Generator，请确保您已阅读并理解服务条款中的重要信息。"
        protocolInformation.backgroundColor = .green
        protocolInformation.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(447)
            make.height.equalTo(54)
            make.width.equalTo(344)
            make.centerX.equalToSuperview()
        }
        
    }
    
    func getCellForDescription() -> UIView {
        let firstTitile = UILabel()
        let firstContent = UILabel()
        let firstStack = UIStackView()
        firstStack.addSubview(firstTitile)
        firstStack.addSubview(firstContent)
        return firstStack
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.backgroundColor = .black
        view.addSubview(button)
        button.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        setUI()
    }
    
    func setUI() {
        contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = 10
        setUpForContentView()
    }
    
    @objc func didButtonClick() {
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        maskView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        maskView.isHidden = false
        maskView.backgroundColor = .clear
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissGuideView))
        maskView.addGestureRecognizer(tapGesture)
        self.view.addSubview(maskView)
        self.view.addSubview(contentView)
        
        UIView.animate(withDuration: 0.3) {
            self.maskView.backgroundColor = UIColor(white: 0.2, alpha: 0.3)
            self.contentView.frame = CGRect(x: 0, y: height - 575, width: width, height: 575)
        }
    }
    
    @objc func dismissGuideView() {
        maskView.isHidden = true
        let width = self.view.frame.width
        let height = self.view.frame.height
        UIView.animate(withDuration: 0.3) {
            self.contentView.frame = CGRect(x: 0, y: height, width: width, height: 575)
        }
        contentView.removeFromSuperview()
        maskView.removeFromSuperview()
    }
}



