//
//  ServiceLocatorImpl.swift
//  fasha-iOS
//
//  Created by anh tranluongtuan on 2017/08/08.
//  Copyright © 2017 anh tranluongtuan. All rights reserved.
//

import Foundation

public class ServiceLocatorImpl: ServiceLocator {
    
    fileprivate lazy var container: Dictionary < String, () -> Any > = [:]
    
    fileprivate static let singleton = ServiceLocatorImpl()
    
    public static var sharedInstance: ServiceLocator { return singleton }
    
    fileprivate init() {
    }
    
    public func add<T>(_ recipe: @escaping () -> T) {
        let key = typeName(T.self)
        container[key] = recipe
    }
    
    public func lookup<T>() -> T {
        let key = typeName(T.self)
        guard let result = container[key] else {
            let result = container.filter { tempKey, _ in
                tempKey == key
                }.first?.value
            return result!() as! T
        }
        return result() as! T
    }
    
    fileprivate func typeName<T>(_ some: T.Type) -> String {
        return "\(some)".replacingOccurrences(of: "Impl", with: "")
    }
}
