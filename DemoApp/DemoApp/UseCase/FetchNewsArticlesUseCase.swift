//
//  FetchNewsArticles.swift
//  DemoApp
//
//  Created by arun-pt6232 on 03/04/23.
//

import Foundation
import UIKit

class FetchNewsArticlesUseCase {
    
    let newsfeedNetworkService = NewsFeedNetworkService()
    let dataManager = NewsDataManager()
    
    func fetchNewsArticle(success: @escaping([Article]) -> Void, failure: @escaping (String) -> Void) {

        self.dataManager.getNewsArticles() { articles in
            DispatchQueue.main.async {
                success(articles)
            }
        } failure: { error in
            DispatchQueue.main.async {
                failure(error)
            }
        }
    }
    
    func getImage(imageURL: String ,completion: @escaping (UIImage?) -> Void) {
        dataManager.getImage(imageURL: imageURL) { image in
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    
    
}
