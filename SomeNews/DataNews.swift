//
//  DataNews.swift
//  SomeNews
//
//  Created by Andrey Boyko on 21.05.2022.
//

import Foundation

struct NewData: Codable {
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    
    func datePublishedAt(string: String) -> String {
        var timmePublished = ""
        let datePublished = string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZ"
        dateFormatter.date(from: datePublished)
        if let date = dateFormatter.date(from: datePublished)
        {
            dateFormatter.dateFormat = "h:mm a" 
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour, .minute, .second],  from: date)
            guard let finalDate = calendar.date(from:components) else { return "" }
            timmePublished = dateFormatter.string(from: finalDate)
        }
        return timmePublished
    }
}

struct NewsData: Codable {
    var articles: [NewData]
}

