//
//  Singleton.swift
//  DesignPattern
//
//  Created by qiyongka on 2023/7/23.
//

import Foundation

class Singleton {

    static let shared = Singleton()
    var name: String = "test for Bytedance"
    private init() {
        // 不要忘记把构造器变成私有
    }
}

func testForSingleton() {
    let singleton = Singleton.shared
    print(singleton.name, "\n")
}

