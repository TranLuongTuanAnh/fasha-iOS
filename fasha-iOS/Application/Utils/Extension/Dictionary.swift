//
//  Dictionary.swift
//  fasha-iOS
//
//  Created by anh tranluongtuan on 2017/08/01.
//  Copyright © 2017 anh tranluongtuan. All rights reserved.
//

import Foundation

public extension Dictionary {
    mutating func merge<K, V>(dictionaries: Dictionary<K, V>...) {
        for dict in dictionaries {
            for (key, value) in dict {
                self.updateValue(value as! Value, forKey: key as! Key)
            }
        }
    }
}
