//
//  ContactsView.swift
//  eenigma
//
//  Created by Nicola De Filippo on 06/10/24.
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
        
    init () {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.red]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = UIColor.red
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
            }
        }.scrollContentBackground(.hidden).background(Color.black)
    }
}

struct RowView: View {
    var contact: Contact
    var body: some View {
        HStack {
            Image(systemName: "person")
            .resizable()
            .frame(width: 30, height: 30)
            Text(contact.aliasName)
        }
    }
}

#Preview {
    ContactsView()
}
