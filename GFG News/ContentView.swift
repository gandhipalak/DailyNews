//
//  ContentView.swift
//  GFG News
//
//  Created by Palak Gandhi on 12/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var httpUtility = HttpUtility()
    
    var body: some View {
        NavigationView {
            List($httpUtility.items, id: \.self) { item in
                NavigationLink(destination: NewsView(imageLink: item.thumbnail, data: item.content, title: item.title))
                {
                    NewsLayout(title: item.title,
                               date: item.pubDate,
                               imageLink: item.thumbnail)
                }.listRowSeparator(.hidden)
            }
            .navigationTitle(Text("Geeks for Geeks"))
        }
        .refreshable {
            httpUtility.fetchData()
        }
        .onAppear {
            httpUtility.fetchData()
        }
    }
}



