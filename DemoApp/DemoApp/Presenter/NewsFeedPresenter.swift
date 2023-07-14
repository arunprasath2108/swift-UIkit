//
//  NewsFeedPresenter.swift
//  DemoApp
//
//  Created by arun-pt6232 on 03/04/23.
//

import UIKit

class NewsFeedPresenter {
    
    let fetchNewsArticlesUseCase = FetchNewsArticlesUseCase()
    var newsArray: [Article] = []
    let dateFormatter = DateFormatter()
    
    func fetchNewsArticle(success: @escaping ([Article]) -> Void, failure: @escaping (String) -> Void) {
        
        fetchNewsArticlesUseCase.fetchNewsArticle() { listOfArticle in
            
            for article in listOfArticle {
                guard let imageURL = article.urlToImage, let newsURL = article.url, let title = article.title, let postedDate = article.publishedAt, let sourceName = article.source else {
                    continue
                }
                let parsedDate = self.parseDateAndTime(postedDate: postedDate)
                let dateToDisplay = self.getDateFormatToDisplay(from: parsedDate, postedDate: postedDate)
                let news = Article(source: sourceName, title: title, url: newsURL, urlToImage: imageURL, publishedAt: dateToDisplay)
                self.newsArray.append(news)
            }
            success(self.newsArray)
        } failure: { errorMessage in
            failure(errorMessage)
        }
    }
    
    func getImage(imageURL: String ,completion: @escaping (UIImage?, String) -> Void) {
        fetchNewsArticlesUseCase.getImage(imageURL: imageURL) { image in
            completion(image, imageURL)
        }
    }
    
    private func parseDateAndTime(postedDate: String) -> (String, String) {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: postedDate)
        let indianTimeZone = TimeZone(identifier: "GMT+5:30")  // IST time zone
        dateFormatter.timeZone = indianTimeZone
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let parsedDate = dateFormatter.string(from: date!)
        dateFormatter.dateFormat = "hh:mm a"
        let parsedTime = dateFormatter.string(from: date!)
        
        return (parsedDate, parsedTime)
    }
    
    func getDateFormatToDisplay(from parsedDateAndTime: (String,String), postedDate: String) -> String {
        let currentDate = Date()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let todayDate = dateFormatter.string(from: currentDate)
        print(" parsed date -> \(parsedDateAndTime.0)  parsedTime -> \(parsedDateAndTime.1)")
        
        //Today's Time
        if parsedDateAndTime.0 == todayDate {
            return parsedDateAndTime.1
        }
        else if parsedDateAndTime.0 == getYesterdayDate() {
            return "Yesterday"
        }
        else {
            return checkForCurrentYear(postedDate: postedDate)
        }
    }

    func getYesterdayDate() -> String? {
        let calendar = Calendar.current
        let currentDate = Date()
        let yesterday = calendar.date(byAdding: .day, value: -1, to: currentDate)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let yesterdayDate = dateFormatter.string(from: (yesterday)!)
        return yesterdayDate
    }

    func checkForCurrentYear(postedDate: String) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let parsedPostedDate = dateFormatter.date(from: postedDate)
        dateFormatter.dateFormat = "yyyy"
        let parsedYear = dateFormatter.string(from: parsedPostedDate!)
        
        let curentDate = Date()
        dateFormatter.dateFormat = "yyyy"
        let currentyear = dateFormatter.string(from: curentDate)
        
        if parsedYear == currentyear {
            dateFormatter.dateFormat = "dd MMM"
            let date = dateFormatter.string(from: parsedPostedDate!)
            return date
        }
        else {
            dateFormatter.dateFormat = "MMM yyyy"
            let date = dateFormatter.string(from: parsedPostedDate!)
            return date
        }
    }
    
//    private func getDateFormatToDisplay(from parsedDateAndTime: (String,String), postedDate: String) -> String {
//        let currentDate = Date()
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        let todayDate = dateFormatter.string(from: currentDate)
//
//        //Today's Time
//        if parsedDateAndTime.0 == todayDate {
//            return parsedDateAndTime.1
//        }
//        else if parsedDateAndTime.0 == getYesterdayDate() {
//            return "Yesterday"
//        }
//        else {
//            return checkForCurrentYear(postedDate: postedDate)
//        }
//    }
//
//    private func getYesterdayDate() -> String? {
//        let calendar = Calendar.current
//        let currentDate = Date()
//        let yesterday = calendar.date(byAdding: .day, value: -1, to: currentDate)
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        let yesterdayDate = dateFormatter.string(from: (yesterday)!)
//        return yesterdayDate
//    }
//
//    private func checkForCurrentYear(postedDate: String) -> String {
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        let postedDateInDateFormat = dateFormatter.date(from: postedDate)
//        dateFormatter.dateFormat = "yyyy"
//        guard let postedYear = dateFormatter.date(from: postedDate) else {
//            return ""
//        }
//        let postedYearString = dateFormatter.string(from: postedYear)
//
//        let date = Date()
//        dateFormatter.dateFormat = "yyyy"
//        let currentYear = dateFormatter.string(from: date)
//
//        if postedYearString == currentYear {
//            dateFormatter.dateFormat = "MMM yyyy"
//            let dateToPresent = dateFormatter.string(from: postedDateInDateFormat!)
//            return dateToPresent
//        }
//        else {
//            dateFormatter.dateFormat = "dd-MM-yyyy"
//            let dateToPresent = dateFormatter.string(from: postedDateInDateFormat!)
//            return dateToPresent
//        }
//    }
    
    //date styles
    //short -> 4/6/23
    //medium -> Apr 6, 2023
    //full -> Thursday, April 6, 2023
    //long -> April 6, 2023
    
}
