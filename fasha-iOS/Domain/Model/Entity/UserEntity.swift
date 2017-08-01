//
//  UserEntity.swift
//  fasha-iOS
//
//  Created by anh tranluongtuan on 2017/07/29.
//  Copyright © 2017 anh tranluongtuan. All rights reserved.
//

import Foundation

class UserEntity {
    private(set) var email: String
    private(set) var username : String
    init(email: String, username: String) {
        self.email = email
        self.username = username
    }
}
