//
//  UserRepositoryImpl.swift
//  fasha-iOS
//
//  Created by anh tranluongtuan on 2017/08/07.
//  Copyright © 2017 anh tranluongtuan. All rights reserved.
//

import Foundation
import PromiseKit
class UserRepositoryImlp: UserRepository {
    func login(email: String, password: String) -> Promise<Any?> {
        let apiClientBase = ApiClientBase()
        return apiClientBase.post(path: "FashaApi/login/", parameters: ["email":email as AnyObject,"password":password as AnyObject], headers: nil)
    }
}
