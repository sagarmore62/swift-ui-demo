//
//  NetworkService.swift
//  SwiftUI-Demo
//
//  Created by Sagar More on 29/06/19.
//  Copyright © 2019 Sagar More. All rights reserved.
//

import Foundation

enum HttpMethod : String {
    case post = "POST"
    case get = "GET"
}

class NetworkService  {
    
    class func startRequest(_ url : String, httpMethod : HttpMethod, completionHandler : @escaping (Data?, Error?) -> Void) {
        let finalUrl = self.getCompleteUrl(url)
        guard let URL = URL(string: finalUrl) else {
            completionHandler(nil, nil)
            return
        }
        
        var request = URLRequest(url: URL)
        request.httpMethod = httpMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request){ (data, response, error) in
            completionHandler(data, error)
        }
        task.resume()
    }
    
    class func getCompleteUrl(_ url : String) -> String {
        return Constants.baseUrl + url + Constants.keyPath + Constants.apiKey
    }
}
