//
//  LoginController.swift
//  fasha-iOS
//
//  Created by anh tranluongtuan on 2017/08/03.
//  Copyright © 2017 anh tranluongtuan. All rights reserved.
//

import Foundation
import UIKit
import Bond
import ReactiveKit


class UserLoginController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        combineLatest(email.reactive.text, password.reactive.text) { emailString , passwordString in
             return (emailString! as NSString).length > 0 && (passwordString! as NSString).length > 0
            }.bind(to: loginBtn.reactive.isEnabled)
        
        LoginState.shareInstance.transitionState.observeNext { state in
            switch(state) {
            case .success:
                let homeVC = UIStoryboard(name:"Home", bundle:nil).instantiateInitialViewController()
                self.navigationController?.pushViewController(homeVC!, animated: true)
                LoginState.shareInstance.transitionState.next(.none)
            default:
                break
            }
        }.dispose(in: reactive.bag)
    }
    @IBAction func tapLogin(_ sender: Any) {
        let userService = UserService()
        userService.login(email: email.text!, password: password.text!)
    }

}
