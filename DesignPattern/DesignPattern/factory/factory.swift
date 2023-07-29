//
//  factory.swift
//  DesignPattern
//
//  Created by ByteDance on 2023/7/23.
//

import Foundation

enum BandLevel {
    case expensive
    case normal
    case cheap
}
 
class Shoe {
    /// 品牌
    var band : String
    /// 尺码
    var size : String
    
    init(band:String, size:String) {
        self.band = band
        self.size = size
    }
    
    func printInfo() {
      print("品牌:\(self.band)=尺码:\(self.size)")
    }
}
 
class putianShoesFactory {
    
    func makeShoes(bandLevel:BandLevel) -> Shoe {
        switch bandLevel {
        case .expensive:
            return Shoe(band: "阿迪王", size: "43")
        case .normal:
            return Shoe(band: "安踏", size: "43")
        case .cheap:
            return Shoe(band: "耐克", size: "43")
        }
    }
}

func testForFactory() {
    let factory = putianShoesFactory()
    factory.makeShoes(bandLevel: .expensive).printInfo()
    factory.makeShoes(bandLevel: .normal).printInfo()
    factory.makeShoes(bandLevel: .cheap).printInfo()
}
 


