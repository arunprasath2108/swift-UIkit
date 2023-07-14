//
//  DBConstant.swift
//  DemoApp
//
//  Created by arun-pt6232 on 15/03/23.
//

import Foundation

class DBConstant {
    
    
    //User Info Table Constants
    static let USERINFO_TABLE = "UserInfo"
    static let USER_ID = "UserID"
    static let USER_NAME = "Username"
    static let EMAIL_ID  = "EmailID"
    static let PASSWORD  = "Password"
    
    //Wishlist Table Constants
    static let WISHLIST_TABLE = "Wishlist"
    static let PRODUCT_ID = "ProductID"
    static let PRODUCT_NAME = "ProductName"
    
    //RecentSearch Table Constants
    static let RECENT_SEARCH_TABLE = "RecentSearch"
    static let SEARCH_TERM = "SearchTerm"
    static let SEARCH_DATE = "SearchDate"
    
    //NewsFeed Table Constants
    static let NEWS_FEED_TABLE = "NewsFeed"
    static let ARTICLE_URL = "ArticleURL"
    static let ARTICLE_SOURCE = "ArticleSource"
    static let ARTICLE_TITLE = "ArticleTitle"
    static let ARTICLE_IMAGE_URL = "ArticleImageURL"
    static let PUBLISHED_AT = "PublishedAt"
    
    //Query Constants
    static let CREATE_TABLE_IF_NOT_EXISTS = "Create table if not exists"
    static let SELECT = "Select"
    static let INSERT_INTO = "Insert into"
    static let UPDATE = "Update"
    static let FROM = "from"
    static let WHERE = "where"
    static let NOT_NULL = "Not null"
    static let UNIQUE = "Unique"
    static let VALUES = "Values"
    static let SET = "Set"
    
    
    //Query keys
    static let PRIMARY_KEY = "Primary key"
    
    //Data types
    static let INTEGER = "Integer"
    static let TEXT = "Text"
    
    
    
    
    
    
    
}
