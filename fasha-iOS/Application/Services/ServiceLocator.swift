//
//  ServiceLocator.swift
//  fasha-iOS
//
//  Created by anh tranluongtuan on 2017/08/08.
//  Copyright © 2017 anh tranluongtuan. All rights reserved.
//

import Foundation

public protocol ServiceLocator {
    func lookup<T>()->T
    func add<T>(_ recipe: @escaping () -> T)
}
