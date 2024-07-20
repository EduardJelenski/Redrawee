//
//  ListBindable.swift
//  SwiftUIConcepts
//
//  Created by eelenskiy on 20.07.2024.
//

import SwiftUI

@Observable
class Book: Identifiable {
    var title = "Sample Book Title"
    var author = "Author"
    var isAvailable = true
}

@Observable
class Library {
    var books: [Book] = [Book(), Book(), Book()]
    
    var availableBooksCount: Int {
        books.filter(\.isAvailable).count
    }
}

struct ListBindable: View {
    
    @State private var books = [Book(), Book(), Book()]
    
    
    var body: some View {
        List(books) { book in
            @Bindable var book = book
            TextField("Title", text: $book.title)
        }
    }
}

#Preview {
    ListBindable()
}
