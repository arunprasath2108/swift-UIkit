//
//  NewsFeed.swift
//  DemoProject
//
//  Created by arun-pt6232 on 20/03/23.
//

import Foundation

struct NewsFeed: Codable {
    
    var status: String?
    var totalResults: Int = 0
    var articles: [Article]?
    
}
