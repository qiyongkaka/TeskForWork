//
//  Strategy.swift
//  DesignPattern
//
//  Created by ByteDance on 2023/7/23.
//

import Foundation

protocol Flyable {
    func fly()
}

class FlyWithWings:Flyable {
    func fly() {
        print("我是会飞的鸭子，我用翅膀飞呀飞")
    }
}

//什么都不会飞
class FlyNoWay:Flyable{
    func fly() {
        print("我是不会飞的鸭子")
    }
}


class Duck{
    //添加行为委托代理者
    var flyBehavior : Flyable! = nil
    
    func setFlyBehavior(_ flyBehavior : Flyable){
        self.flyBehavior = flyBehavior
    }
    func swim(){
        print("鸭子游泳喽～")
    }
    
    func quack(){
        print("鸭子呱呱叫")
    }
    
    func display(){
    }
    
    //执行飞的行为
    func performFly(){
        guard self.flyBehavior != nil else {
            return
        }
        self.flyBehavior.fly()
    }
}


class MallarDuck : Duck{
    override init() {
        super.init()
        self.setFlyBehavior(FlyWithWings())
    }
    override func display() {
        print("我是绿头鸭子")
    }
}

class RedHeadDuck:Duck{
    override init() {
        super.init()
        self.setFlyBehavior(FlyWithWings())
    }
    override func display() {
        print("我是红头鸭子")
    }
}

class RubberDuck:Duck{
    override init() {
        super.init()
        self.setFlyBehavior(FlyNoWay())
    }
    override func display() {
        print("橡皮鸭")
    }
}

class ModelDuck : Duck {
    override init() {
        super.init()
        self.setFlyBehavior(FlyWithWings())
    }
    override func display() {
        print("鸭子模型")
    }
}

class FlyAutomaticPower : Flyable {
    func fly() {
        print("我是用发动机飞的鸭子")
    }
}

func testForStrategy() {
    //    print("鸭子：使用延展")
    //    let mallarDuck : MallarDuck = MallarDuck()
    //    mallarDuck.fly()
        
    print("鸭子：使用接口")
    var duck : Duck = MallarDuck()
    duck.performFly()
    duck.setFlyBehavior(FlyNoWay())
    duck.performFly()
    print("-----创建一个模型鸭子，且会飞")
    duck = ModelDuck()
    duck.performFly()
    print("-----给模型鸭子装发动机，支持飞")
    duck.setFlyBehavior(FlyAutomaticPower())
    duck.performFly()
    print("\n")
}
