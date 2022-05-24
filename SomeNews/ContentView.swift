//
//  ContentView.swift
//  SomeNews
//
//  Created by Andrey Boyko on 21.05.2022.
//

import SwiftUI
import Combine


struct ContentView: View {
    @State var showLink = false
    @State var text = ""
    @ObservedObject var news = NewViewModel()
    var body: some View {
        VStack {
            SearchBar(text: $text)
            List {
                ForEach(news.newsWhisId.filter({"\($0)".contains(text.lowercased()) || text.isEmpty})) { new in
                    if new.urlToImage != "" {
                        if let urlImage = URL(string: new.urlToImage) {
                            AsyncImage(url: urlImage,
                                       placeholder: { Text("Loading ...") },
                                       image: { Image(uiImage: $0).resizable()
                                       })
                                .frame(width: 300, height: 70)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    HStack {
                        VStack {
                            
                            Text(new.title)
                                .font(.system(.footnote))
                                .bold()
                            Text(new.description)
                                .font(.system(.footnote))
                            
                        }
                        if let time = new.time {
                            Text(time)
                                .font(.system(.footnote))
                        }
                        Button(action: {
                            self.showLink.toggle()
                            if let yourURL = URL(string: new.url) {
                                UIApplication.shared.open(yourURL, options: [:], completionHandler: nil)
                            }
                        }, label: {
                            Image(systemName: "chevron.right")
                        })
                    }
                }
                .frame(height: 100)
            }
            
        }
        .onAppear  {
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
