//
//  obersever.swift
//  DesignPattern
//
//  Created by qiyongka on 2023/7/23.
//

import Foundation


protocol Subject {
    func addObserver(observer: any Observer)
    func removeObserver(observer: any Observer)
    func notifyObservers()
}

protocol Observer: Equatable {
    
    func update(temperature: Double)
}

class WeatherStation: Subject {
    
    var temperature: Double = 0
    var observers: [any Observer] = []
    
    func addObserver(observer: any Observer) {
        observers.append(observer)
    }
    
    func removeObserver(observer: any Observer) {
        if let index = observers.firstIndex(where: { guard let left = $0 as? Display, let right = observer as? Display else { return false }
            if left === right { return true } else { return false }
        }) {
            observers.remove(at: index)
        }
    }
    
    func notifyObservers() {
        for observer in observers {
            observer.update(temperature: temperature)
        }
    }
    
    func setTemperature(temperature: Double) {
        self.temperature = temperature
        notifyObservers()
    }
}

class Display: Observer {
    static func == (lhs: Display, rhs: Display) -> Bool {
        if lhs === rhs {
            return true
        } else {
            return false
        }
    }
    
    func update(temperature: Double) {
        print("当前温度为：\(temperature)")
    }
}

func testForObserver() {
    let weatherStation = WeatherStation()
    let display1 = Display()
    let display2 = Display()

    weatherStation.addObserver(observer: display1)
    weatherStation.addObserver(observer: display2)

    weatherStation.setTemperature(temperature: 25)
    weatherStation.removeObserver(observer: display1)
    print(weatherStation.observers.count)
}

