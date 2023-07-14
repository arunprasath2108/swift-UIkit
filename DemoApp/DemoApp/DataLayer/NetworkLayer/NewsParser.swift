//
//  Parser.swift
//  DemoApp
//
//  Created by arun-pt6232 on 04/04/23.
//

import Foundation

class NewsParser {

    
    func parseNewsArticle(data: Data, success: @escaping (NewsFeed) -> Void, failure: @escaping (String) -> Void) {
        do {
            let decoder = JSONDecoder()
            let newsFeed = try! decoder.decode(NewsFeed.self, from: data)
            success(newsFeed)
        }
        catch {
            failure("Can't parse the News Articles")
        }
        
    }
    
}
