//
//  bridge.swift
//  DesignPattern
//
//  Created by qiyongka on 2023/8/2.
//

import Foundation

protocol Implementation {

    func operationImplementation() -> String
}

fileprivate class Abstraction {

    fileprivate var implementation: Implementation

    init(_ implementation: Implementation) {
        self.implementation = implementation
    }

    func operation() -> String {
        let operation = implementation.operationImplementation()
        return "Abstraction: Base operation with:\n" + operation
    }
}

fileprivate class ExtendedAbstraction: Abstraction {

    override func operation() -> String {
        let operation = implementation.operationImplementation()
        return "ExtendedAbstraction: Extended operation with:\n" + operation
    }
}

fileprivate class ConcreteImplementationA: Implementation {

    func operationImplementation() -> String {
        return "ConcreteImplementationA: Here's the result on the platform A.\n"
    }
}

fileprivate class ConcreteImplementationB: Implementation {

    func operationImplementation() -> String {
        return "ConcreteImplementationB: Here's the result on the platform B\n"
    }
}

fileprivate class Client {
    // ...
    static func someClientCode(abstraction: Abstraction) {
        print(abstraction.operation())
    }
    // ...
}



func testForBridge() {
    // The client code should be able to work with any pre-configured
    // abstraction-implementation combination.
    let implementation = ConcreteImplementationA()
    Client.someClientCode(abstraction: Abstraction(implementation))

    let concreteImplementation = ConcreteImplementationB()
    Client.someClientCode(abstraction: ExtendedAbstraction(concreteImplementation))
}
