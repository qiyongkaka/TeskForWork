//
//  obersever.swift
//  DesignPattern
//
//  Created by ByteDance on 2023/7/23.
//

import Foundation


protocol Subject {
    func addObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyObservers()
}

protocol Observer {
    func update(temperature: Double)
    
}

class WeatherStation: Subject {
    var temperature: Double = 0
    var observers: [Observer] = []
    
    func addObserver(observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(observer: Observer) {
//        if let index = observers.firstIndex(where: { $0 === observer }) {
//            observers.remove(at: index)
//        }
        observers.removeAll()
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
}

