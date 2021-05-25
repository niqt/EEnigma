//
//  Chat.swift
//  eenigma
//
//  Created by nicola on 25/05/21.
//

import Foundation

struct Chat: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var lastMessage: String
    var timestamp: Date
    var chatId: String
}
