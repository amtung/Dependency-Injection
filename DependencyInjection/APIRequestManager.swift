//
//  APIRequestManager.swift
//  DependencyInjection
//
//  Created by Annie Tung on 5/4/17.
//  Copyright © 2017 Annie Tung. All rights reserved.
//

import UIKit

class APIRequestManager {
    
    static let manager = APIRequestManager()
    private init() {}
    
    func getData(endPoint: String, callback: @escaping (Data?) -> Void) {
        guard let myURL = URL(string: endPoint) else { return }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: myURL) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("Error durring session: \(error)")
            }
            guard let validData = data else { return }
            
            callback(validData)
            }.resume()
    }
    
    func getImage(endpoint: String, callback: @escaping (UIImage?) -> Void) {
        getData(endPoint: endpoint) { (data) in
            if let validData = data {
                do {
                    callback(UIImage(data: validData))
                }
            }
            else {
                callback(nil)
            }
        }
    }
}
