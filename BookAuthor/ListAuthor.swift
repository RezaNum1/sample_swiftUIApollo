//
//  ListAuthor.swift
//  Author
//
//  Created by Reza Harris on 23/07/21.
//

import SwiftUI

// Sample Code for Fetch data from Apollo in switfUI

struct ListAuthor: View {
    @State var authors = [Author]()
    
    func fetchData() {
        self.authors = [Author]()
        Network.shared.apollo.fetch(query: GetAllUserQuery()) { result in
            switch result {
            case .success(let graphlQLResult):
                DispatchQueue.main.async {
                    if let data = graphlQLResult.data?.users {
                        for dt in data {
                            authors.append(Author(id: dt!.id, name: dt!.name, address: "California"))
                        }
                    }
                }
            case .failure(let error):
                print("****")
                print("Error: \(error)")
            }
        }
        print("Test")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(authors, id:\.id) { item in
                        NavigationLink(destination: DetailAuthor(author: item)) {
                            AuthorRow(author: item)
                        }
                    }
                }
            }
            .onAppear {
                print("Hello")
                fetchData()
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Author")
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: AddAuthor()
                                    ) {
                                        Button(action: {
                                            print("CLICKED")
                                        }, label: {
                                            Image(systemName: "plus").imageScale(.large)
                                        })
                                    }
            )
        }
    }
}

struct ListAuthor_Preview: PreviewProvider {
    static var previews: some View {
        ListAuthor()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}

// Model
struct Author: Identifiable {
    var id: String
    var name: String
    var address: String
}

// Component
struct AuthorRow: View {
    var author: Author
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(author.name)
                Text(author.address).font(.subheadline).foregroundColor(.gray)
            }
        }
    }
}

