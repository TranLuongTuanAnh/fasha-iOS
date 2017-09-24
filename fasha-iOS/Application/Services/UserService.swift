//
//  UserService.swift
//  fasha-iOS
//
//  Created by anh tranluongtuan on 2017/08/07.
//  Copyright © 2017 anh tranluongtuan. All rights reserved.
//

import Foundation
import PromiseKit

class UserService:NSObject {
    func login(email:String, password:String) {
        _ = firstly { _ -> Promise<Any?>  in
            LoginState.shareInstance.transitionState.next(.loading)
            let domain = UserDomainFactory.domain
            return (domain?.userRepository.login(email: email, password: password))!
         }.then {  obj -> () in
            LoginState.shareInstance.transitionState.next(.success)
            debugPrint(obj as AnyObject)
        }
    }
}
