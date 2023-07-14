//
//  NewsFeedNetworkService.swift
//  DemoApp
//
//  Created by arun-pt6232 on 21/03/23.
//

import Foundation
import UIKit

class NewsFeedNetworkService {
    
    var parser = NewsParser()
    var network = NetworkHandler()
    
    func getNewsArticle(success: @escaping ([Article]) -> Void, failure: @escaping (String) -> Void) {
        
        let query = "everything?q=shopping&sortBy=publishedAt&lang=en"
        let urlString = NetworkHandler.newsBaseURL + query + "&apiKey=" + NetworkHandler.newsAPIKey
        
        network.performDataTask(urlString: urlString) { data,errorMessage in
            if let data = data {
                self.parser.parseNewsArticle(data: data) { newsFeed in
                    success(newsFeed.articles)
                } failure: { error in
                    failure(error)
                }
            }
            else {
                failure(errorMessage)
            }
        }
    }
    
    func getImage(imageURL: String, completion: @escaping (UIImage?)->Void) {
        
        network.performDataTask(urlString: imageURL) { data, errorMessage in
            if errorMessage != "" {
                print(errorMessage)
                completion(nil)
            }
            guard let data = data else {
                completion(nil)
                return
            }
            if let image = UIImage(data: data) {
                completion(image)
            } else {
                print("Error in downloading image from data")
                completion(nil)
            }
        }
    }

}
