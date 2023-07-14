//
//  Network.swift
//  DemoApp
//
//  Created by arun-pt6232 on 04/04/23.
//

import Foundation

class NetworkHandler {
    
     static let newsAPIKey: String = "d41250fef91d4968ab796085856f902f"
     static let newsBaseURL: String = "https://newsapi.org/v2/"
    
     static let shared = URLSession.shared
    
    
    func performDataTask(urlString: String, completion: @escaping (Data?, String) -> Void) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = NetworkHandler.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            if error == nil && data != nil {
                completion(data, "")
            }
            else {
                completion(nil, "Can't get the News Articles")
            }
        }
        dataTask.resume()
    }
}
