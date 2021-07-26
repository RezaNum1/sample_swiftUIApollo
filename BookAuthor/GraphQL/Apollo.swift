//
//  Apollo.swift
//  BookAuthor
//
//  Created by Reza Harris on 24/07/21.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    var apollo = ApolloClient(url: URL(string: "http://localhost:4000/graphql")!)
}
