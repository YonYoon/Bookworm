//
//  AddBookView.swift
//  Bookworm
//
//  Created by Zhansen Zhalel on 03.01.2024.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var rating = 3
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Romance"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let book = Book(title: title, author: author, genre: genre, rating: rating, review: review)
                        modelContext.insert(book)
                        dismiss()
                    }
                    .disabled(checkValidation())
                }
            }
            .navigationTitle("Add book")
        }
    }
    
    func checkValidation() -> Bool {
        if title.hasNoLetters() || author.hasNoLetters() || review.hasNoLetters() {
            return true
        }
        
        return false
    }
}

#Preview {
    AddBookView()
}

extension String {
    func hasNoLetters() -> Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
