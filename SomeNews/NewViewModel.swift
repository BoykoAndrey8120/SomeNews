//
//  NewViewModel.swift
//  SomeNews
//
//  Created by Andrey Boyko on 21.05.2022.
//

import SwiftUI

class NewViewModel: ObservableObject {
    @Published var news: [NewData] = []
    @Published var newsWhisId: [New] = []
    
    init() {
        self.newsWhisId = addNews()
    }
    func addNews() -> [New] {
        Api().getPost { (new) in
            new.articles.forEach {
              let inst = New(title: $0.title ?? "",
                                 description: $0.description ?? "",
                                 url: $0.url ?? "",
                                 urlToImage: $0.urlToImage ?? "",
                                 publishedAt: $0.publishedAt ?? "",
                                 time: $0.datePublishedAt(string: $0.publishedAt ?? "")
              )
                self.newsWhisId.append(inst)
            }
        }
        return newsWhisId
    }
}
