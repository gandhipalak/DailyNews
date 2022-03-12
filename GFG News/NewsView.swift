//
//  NewsView.swift
//  GFG News
//
//  Created by Palak Gandhi on 12/03/22.
//

import SwiftUI

struct NewsView: View {
    
    @Binding var imageLink: String
    @Binding var data: String
    @Binding var title: String
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: imageLink)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Text("Image is not available at the moment")
                }
                Divider()
                    .padding(.bottom, 10)
                Text(title)
                    .foregroundColor(.secondary)
                    .font(.system(.headline))
                    .padding(.bottom, 10)
                Text(data)
                    .foregroundColor(.black)
                    .font(.system(.title))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 10)
                
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(imageLink: .constant("Link"), data: .constant("Data"), title:  .constant("Author"))
    }
}
