//
//  ChatView.swift
//  eenigma
//
//  Created by nicola on 24/05/21.
//

import SwiftUI

struct ChatView: View {
    var chats: Array<Chat> = [Chat(name: "Alice", image: "person", lastMessage: "Bye", timestamp: Date(), chatId: "1"),
      Chat(name: "Bob", image: "person", lastMessage: "See soon", timestamp: Date(), chatId: "2")
    ]
    var body: some View {
        List {
            ForEach(chats) { chat in
                if chat.name == "Bob" {
                    UserRowView(chat: chat)
                } else {
                    ChatRowView(chat: chat)
                }
            }
        }.listStyle(SidebarListStyle())
        
    }
}


struct ChatRowView: View {
    var chat: Chat
    var body: some View {
        HStack() {
            Image(systemName: chat.image)
                .resizable()
                .frame(width: 30, height: 30)
                .padding()
            Text(chat.lastMessage)
            Spacer()
        }.frame(maxWidth: 200)
        .background(Color.blue)
        .cornerRadius(10)
    }
}

struct UserRowView: View {
    var chat: Chat
    var body: some View {
        HStack() {
            Spacer()
            HStack {
                Spacer()
                Text(chat.lastMessage)
                    .padding()
                
            }.frame(minWidth: 10, maxWidth: 200)
            .background(Color.green)
            .cornerRadius(10)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
