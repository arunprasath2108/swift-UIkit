//
//  NewsFeedDBController.swift
//  DemoApp
//
//  Created by arun-pt6232 on 04/04/23.
//

import Foundation

class NewsFeedDBController {
    
    let tableName = DBConstant.NEWS_FEED_TABLE
    
    func addNews(articles: [Article], completion: @escaping (String?) -> Void) {
        
        for article in articles {
            let columns = [
                DBConstant.ARTICLE_TITLE : article.title,
                DBConstant.ARTICLE_SOURCE : (article.source?.name),
                DBConstant.PUBLISHED_AT : article.publishedAt,
                DBConstant.ARTICLE_URL : article.url,
                DBConstant.ARTICLE_IMAGE_URL: article.urlToImage
            ]
            
            if !DBConnector.shared.insert(tableName: tableName,
                                          values: columns as [String : Any]) {
                completion(nil)
                return
            }
            completion("Added Successfully")
        }
    }
    
    func getNewsArticles(success: @escaping ([[String: Any]]?) -> Void, failure: @escaping (String) -> Void)  {
        let news = (DBConnector.shared.select(tableName: tableName))
        if news == nil {
            print("Error in getting news articles")
            failure("Error in getting news articles")
        }
        else {
            success(news)
        }
        
    }
    
    
}

