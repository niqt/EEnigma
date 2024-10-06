//
//  Chat.swift
//  eenigma
//
//  Created by Nicola De Filippo on 06/10/24.
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
