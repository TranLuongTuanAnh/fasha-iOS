//
//  User.swift
//  fasha-iOS
//
//  Created by anh tranluongtuan on 2017/08/07.
//  Copyright © 2017 anh tranluongtuan. All rights reserved.
//

import Foundation
class UserDomain {
     public var userRepository: UserRepository! {
        let locator = ServiceLocatorImpl.sharedInstance
        let repository: UserRepository = locator.lookup()
        return ImplicitlyUnwrappedOptional(repository)
    }
}

class UserDomainFactory {
    public static var domain:UserDomain! = UserDomain()
    
    func destroy() {
        UserDomainFactory.domain = nil
    }
    
}
