//
//  LoginState.swift
//  fasha-iOS
//
//  Created by anh tranluongtuan on 2017/08/07.
//  Copyright © 2017 anh tranluongtuan. All rights reserved.
//

import Foundation
import Bond
import ReactiveKit

enum LoginStateType {
    case loading
    case success
    case failure
}

class LoginState {
    static let shareInstance = LoginState()
    var transitionState = Observable<LoginStateType>(.success)
}
