// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let newsData = try? newJSONDecoder().decode(NewsData.self, from: jsonData)

import Foundation

// MARK: - NewsData
struct NewsData: Codable {
    let status: String
    let feed: Feed
    let items: [Item]
}

// MARK: - Feed
struct Feed: Codable {
    let url: String
    let title: String
    let link: String
    let author, feedDescription: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case url, title, link, author
        case feedDescription = "description"
        case image
    }
}

// MARK: - Item
struct Item: Hashable, Codable {
    var title, pubDate: String
    var link, guid: String
    var author: String
    var thumbnail: String
    var itemDescription, content: String
    var categories: [String]

    enum CodingKeys: String, CodingKey {
        case title, pubDate, link, guid, author, thumbnail
        case itemDescription = "description"
        case content, categories
    }
}

// MARK: - Enclosure
struct Enclosure: Codable {
    let link: String
    let type: TypeEnum
    let thumbnail: String
}

enum TypeEnum: String, Codable {
    case imageJPEG = "image/jpeg"
}
