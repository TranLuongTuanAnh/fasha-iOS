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
    func get(path:String , queryParams:[String:AnyObject]?, headers:[String:String]?) {
        let urlAndHeaders = createUrlRequest(path: path, headers: headers)
        Alamofire.request(urlAndHeaders.url, method: .get, parameters: queryParams, encoding: URLEncoding.default, headers: urlAndHeaders.header).responseJSON(completionHandler: {response in
            debugPrint(response)
        })
    }
    func post(path:String, parameters:[String:AnyObject], headers:[String:String]?) {
        let urlAndHeaders = createUrlRequest(path: path, headers: headers)
        Alamofire.request(urlAndHeaders.url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: urlAndHeaders.header).responseJSON { response in
            debugPrint(response)
        }
    }
    func delete(path:String, queryParams:[String:AnyObject], headers:[String:String]) {
        let urlAndHeaders = createUrlRequest(path: path, headers: headers)
        Alamofire.request(urlAndHeaders.url, method: .delete, parameters: queryParams, encoding: URLEncoding.default, headers: urlAndHeaders.header).responseJSON { (response) in
            debugPrint(response)
        }
    }
    private func createUrlRequest(path:String, headers:[String:String]?) -> (url:URL, header:HTTPHeaders) {
        let url = baseUrl.appendingPathComponent(path)
        
        var requestHeader = self.headers
        if let headers = headers {
            requestHeader.merge(dictionaries: headers)
        }
        return (url,requestHeader)
    }
}
