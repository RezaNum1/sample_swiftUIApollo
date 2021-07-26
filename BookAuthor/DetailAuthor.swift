//
//  DetailAuthor.swift
//  Author
//
//  Created by Reza Harris on 23/07/21.
//

import SwiftUI

struct DetailAuthor: View {
    var author: Author
    
    var body: some View {
        VStack {
            Text(author.name).font(.title)
            
            HStack {
                Text("\(author.address)")
            }
            
            Spacer()
        }
    }
}

