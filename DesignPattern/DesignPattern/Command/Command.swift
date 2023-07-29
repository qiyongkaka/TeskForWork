//
//  Command.swift
//  DesignPattern
//
//  Created by ByteDance on 2023/7/23.
//

import Foundation

protocol RemoteActions {
    func turnOn()
}

protocol Product {
    var description: String { get set }
}

struct Light: Product {
    var description: String
    // some other properties
}

struct Heater: Product {
    var description: String
    // some other properties
}

class LightOn: RemoteActions {

    var light: Light

    init(light: Light) {
        self.light = light
    }

    func turnOn() {
        print("\(light.description) on")
    }
}

class HeaterOn: RemoteActions {

    var heater: Heater

    init(heater: Heater) {
        self.heater = heater
    }

    func turnOn() {
        print("\(heater.description) on")
    }
}


class Remote {
    func doAction(action: RemoteActions) {
        action.turnOn()
    }
}

func testForCommand() {
    let r = Remote()
    let l = Light(description: "light1")
    let h = Heater(description: "heater1")
    let lo = LightOn(light: l)
    let ho = HeaterOn(heater: h)
    r.doAction(action: lo)
    r.doAction(action: ho)
    print("\n")
}



