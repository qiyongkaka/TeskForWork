//
//  Extension+String.swift
//  EENavigator
//
//  Created by liuwanlin on 2019/1/2.
//

import Foundation

extension String {
    var trimTrailingSlash: String {
        var result = self
        while result.hasSuffix("/") {
            result = "" + result.dropLast()
        }
        return result
    }
}
