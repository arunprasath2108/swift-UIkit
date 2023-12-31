//
//  Article.swift
//  DemoProject
//
//  Created by arun-pt6232 on 20/03/23.
//

import Foundation

struct Article: Codable {
    
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
