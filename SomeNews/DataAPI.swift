//
//  DataAPI.swift
//  SomeNews
//
//  Created by Andrey Boyko on 21.05.2022.
//

import SwiftUI

class Api {
    func getPost(complition: @escaping (NewsData) -> Void) {
        guard let url = URL(string:  "https://newsapi.org/v2/top-headlines?country=ua&apiKey=377e4eb6bfcb4da693dc49ea957c6464") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            let news = try! JSONDecoder().decode(NewsData.self, from: data)
            DispatchQueue.main.async {
                complition(news)
            }
        }
        .resume()
    }
}

