//
//  AddAuthor.swift
//  Author
//
//  Created by Reza Harris on 23/07/21.
//

import SwiftUI

struct AddAuthor: View {
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = ""
    @State var address: String = ""
    
    func addItem() {
//        self.isLinkActive = true
        self.presentationMode.wrappedValue.dismiss()
        print(name)
        print(address)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack (alignment: .leading) {
                Text("Author Name")
                TextField("Enter Author Name....", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.bottom, 10)
            VStack (alignment: .leading) {
                Text("Address")
                TextEditor(text: $address)
                    .frame(height: 200)
                    .border(Color.gray)
            }
            Button(action: {
                addItem()
            }) {
                Text("Submit")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding(.top, 20)
            Spacer()
        }
        .padding()
    }
}


struct AddAuthors_Preview: PreviewProvider {
    static var previews: some View {
        AddAuthor()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}

