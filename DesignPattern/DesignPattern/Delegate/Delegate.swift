//
//  Delegate.swift
//  DesignPattern
//
//  Created by ByteDance on 2023/7/29.
//

import Foundation

protocol SubjectForDelegate {
    func request()
}

class RealSubject: SubjectForDelegate {

    func request() {
        print("RealSubject: Handling request.")
    }
}

class Proxy: SubjectForDelegate {

    private var realSubject: RealSubject

    init(_ realSubject: RealSubject) {
        self.realSubject = realSubject
    }
    
    func request() {
        if (checkAccess()) {
            realSubject.request()
            logAccess()
        }
    }

    private func checkAccess() -> Bool {
        print("Proxy: Checking access prior to firing a real request.")
        return true
    }

    private func logAccess() {
        print("Proxy: Logging the time of request.")
    }
}

class ClientForDelegate {
    
    static func clientCode(SubjectForDelegate: SubjectForDelegate) {
        SubjectForDelegate.request()
    }
}

func testForDelegate() {
    let realSubject = RealSubject()
    ClientForDelegate.clientCode(SubjectForDelegate: realSubject)

    print("\nClient: Executing the same client code with a proxy:")
    let proxy = Proxy(realSubject)
    ClientForDelegate.clientCode(SubjectForDelegate: proxy)
}
