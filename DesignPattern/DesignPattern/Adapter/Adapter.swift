//
//  Adapter.swift
//  DesignPattern
//
//  Created by qiyongka on 2023/7/24.
//

class Target {
    func request() -> String {
        return "Target: The default target's behavior."
    }
}

/// The Adaptee contains some useful behavior, but its interface is incompatible
/// with the existing client code. The Adaptee needs some adaptation before the
/// client code can use it.
class Adaptee {

    public func specificRequest() -> String {
        return ".eetpadA eht fo roivaheb laicepS"
    }
}

class Adapter: Target {

    private var adaptee: Adaptee

    init(_ adaptee: Adaptee) {
        self.adaptee = adaptee
    }

    override func request() -> String {
        return "Adapter: (TRANSLATED) " + adaptee.specificRequest().reversed()
    }
}

class ClientForAdapter {
    static func someClientCode(target: Target) {
        print(target.request())
    }
}

func testForAdapter() {
    print("\n")
    ClientForAdapter.someClientCode(target: Target())

    let adaptee = Adaptee()
    print("\n")
    print("Adaptee: " + adaptee.specificRequest())

    print("\n")
    ClientForAdapter.someClientCode(target: Adapter(adaptee))
}
