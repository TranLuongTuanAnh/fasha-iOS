//
//  UserRepository.swift
//  fasha-iOS
//
//  Created by anh tranluongtuan on 2017/08/07.
//  Copyright © 2017 anh tranluongtuan. All rights reserved.
//

import Foundation
import PromiseKit

protocol UserRepository {
    func login(email:String, password:String) -> Promise<Any?>
}
