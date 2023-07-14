//
//  DataManager.swift
//  DemoApp
//
//  Created by arun-pt6232 on 04/04/23.
//

import Foundation
import UIKit

class NewsDataManager {
    
    let newsFeedNetworkService = NewsFeedNetworkService()
    let newsFeedDBController = NewsFeedDBController()
    let fileHandler = FileHandler()
    
    func getNewsArticles(success: @escaping ([Article]) -> Void, failure: @escaping (String) -> Void) {
        
        DispatchQueue.global().async { [self] in
            //DB call
            newsFeedDBController.getNewsArticles() { [self] newsData in
                guard let arrayOfNews = getArticles(from: newsData) else {
                    print("Can't get the news article from DB")
                    return
                }
                success(arrayOfNews)
            } failure: { errorMessage in
                print(errorMessage)
            }
            //Network call
            newsFeedNetworkService.getNewsArticle { articles in
                self.newsFeedDBController.addNews(articles: articles) { responseMessage in
                    if responseMessage == nil {
                        print("Can't save Article in DB")
                    }
                }
                success(articles)
            } failure: { error in
                failure(error)
            }
        }
    }
    
    func getArticles(from dictOfArticle: [[String: Any]]?) -> [Article]? {
        var articles: [Article] = []
        if let arrayOfDict = dictOfArticle {
            for article in arrayOfDict {
                if let articleSource = article["ArticleSource"] as? String,
                   let articleURL = article["ArticleURL"] as? String,
                   let articlePostedDate = article["PublishedAt"] as? String,
                   let articleTitle = article["ArticleTitle"] as? String,
                   let articleImageURL = article["ArticleImageURL"] as? String {
                    //article source contains (id, name), we get only (name)
                   let source = Source(id: nil, name: articleSource)
                   let newsArticle = Article(source: source, title: articleTitle, url: articleURL, urlToImage: articleImageURL, publishedAt: articlePostedDate)
                    articles.append(newsArticle)
                }
            }
        }
        return articles
    }
    
    func getImage(imageURL: String ,completion: @escaping (UIImage?) -> Void) {
        
        DispatchQueue.global().async { [self] in
            let image = fileHandler.getImageFromFile(imageURL: imageURL)
            if image != nil {
                completion(image)
            }
            else {
                newsFeedNetworkService.getImage(imageURL: imageURL) { image in
                    guard let imageData = image else {
                        return
                    }
                    completion(imageData)
                    self.fileHandler.saveImageToFile(imageURL: imageURL, image: imageData)
                }
            }
        }
        
    }
    
    
                                                       
                                                       
}
                                                       
                                                       
