//
//  Contact.swift
//  eenigma
//
//  Created by Nicola De Filippo on 06/10/24.
//

import Foundation

struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var lastName: String
    var aliasName: String
}
