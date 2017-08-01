//
//  ApiClientBase.swift
//  fasha-iOS
//
//  Created by anh tranluongtuan on 2017/07/30.
//  Copyright © 2017 anh tranluongtuan. All rights reserved.
//

import Foundation
import Alamofire

class ApiClientBase {
    let baseUrl: URL = URL(string:"http://localhost:8000/")!
    let headers: HTTPHeaders = [
        "Accept": "application/json"
    ]
    init() {
    }
    func get(path:String , parameters:[String:AnyObject]?, headers:[String:String]?) {
        let url = baseUrl.appendingPathComponent(path)
        var requestHeader = self.headers
        if let headers = headers {
            requestHeader.merge(dictionaries: headers)
        }
        Alamofire.request(url, method: .get, parameters: parameters, headers: requestHeader).responseJSON(completionHandler: {response in
            debugPrint(response)
        })
    }
}
