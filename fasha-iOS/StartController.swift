//
//  ViewController.swift
//  fasha-iOS
//
//  Created by anh tranluongtuan on 2017/07/28.
//  Copyright © 2017 anh tranluongtuan. All rights reserved.
//

import UIKit

class StartController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let apiclient = ApiClientBase()
        apiclient.get(path: "FashaApi/index", queryParams: nil, headers: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

