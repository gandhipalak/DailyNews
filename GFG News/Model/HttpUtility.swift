//
//  HttpUtility.swift
//  GFG News
//
//  Created by Palak Gandhi on 12/03/22.
//

import Foundation

class HttpUtility: ObservableObject {
    
    @Published var items : [Item] = []
    
    func fetchData() {
        let url = URL(string: "https://api.rss2json.com/v1/api.json?rss_url=http://www.abc.net.au/news/feed/51120/rss.xml")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { dataFetched, responseFetched, error in
            if error == nil && dataFetched != nil {
                if let response = responseFetched as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        do {
                            let data = try JSONDecoder().decode(NewsData.self, from: dataFetched!)
                            DispatchQueue.main.async {
                                self.items = data.items
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
        task.resume()
    }
}
