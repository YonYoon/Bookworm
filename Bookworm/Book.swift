//
//  Book.swift
//  Bookworm
//
//  Created by Zhansen Zhalel on 03.01.2024.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String
    var rating: Int
    var review: String
    let date = Date.now
    
    init(title: String, author: String, genre: String, rating: Int, review: String) {
        self.title = title.trimmingCharacters(in: .whitespacesAndNewlines)
        self.author = author.trimmingCharacters(in: .whitespacesAndNewlines)
        self.genre = genre
        self.rating = rating
        self.review = review.trimmingCharacters(in: .whitespaces)
    }
}
