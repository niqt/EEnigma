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
    ]
    
    var body: some View {
        List {
            ForEach(contacts) { contact in
                RowView(contact: contact)
            }
        }
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

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
