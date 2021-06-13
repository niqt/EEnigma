//
//  ContactsView.swift
//  eenigma
//
//  Created by nicola on 24/05/21.
//

import SwiftUI

struct ContactsView: View {
    var contacts: Array<Contact> = [Contact(name: "Alice", lastName: "Fish", aliasName: "Alix"),
                                    Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
                                    , Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
                                    , Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
                                    , Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
                                    , Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
                                    , Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
                                    , Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
                                    , Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
                                    , Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
                                    , Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
                                    , Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
                                    , Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
                                    , Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
                                    , Contact(name: "Bob", lastName: "Bird", aliasName: "Bobby")
    ]
    
    init() {
        UITableView.appearance().backgroundColor = .none
        UITableViewCell.appearance().backgroundColor = .none
    }
    
    var body: some View {
        List {
            ForEach(contacts) { contact in
                ZStack(alignment: .leading) {
                    RowView(contact: contact)
                    NavigationLink(destination: ChattingView()) {
                        EmptyView()
                    }.buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                }
            }.listRowBackground(Color.clear)
        }.background(Color.black)
        .ignoresSafeArea()
    }
}

struct RowView: View {
    var contact: Contact
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
            Text(contact.aliasName)
                .foregroundColor(.white)
        }
        //.opacity(1)
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
