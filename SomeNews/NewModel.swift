//
//  NewModel.swift
//  SomeNews
//
//  Created by Andrey Boyko on 21.05.2022.
//

import SwiftUI

struct New: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String?
    var time: String?
}

struct News: Identifiable {
    var id = UUID()
    var articles: [New]
}

