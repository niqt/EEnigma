//
//  ChatView.swift
//  eenigma
//
//  Created by nicola on 24/05/21.
//

import SwiftUI

struct ChatsView: View {
    var chats: Array<Chat> = [Chat(name: "Alice", image: "person", lastMessage: "Bye", timestamp: Date(), chatId: "1"),
                              Chat(name: "Bob", image: "person", lastMessage: "See soon", timestamp: Date(), chatId: "2")
    ]
    
    init() {
        UITableView.appearance().backgroundColor = .none
        UITableViewCell.appearance().backgroundColor = .none
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(chats) { chat in
                        ZStack(alignment: .leading) {
                            RowLastChat(chat: chat)
                            NavigationLink(
                                destination: ChattingView())
                                {}.buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                        }
                    }.listRowBackground(Color.clear)
                }.background(Color.black)
            }.navigationBarTitle("Chats", displayMode: .inline)
            .foregroundColor(.white)
            .background(Color.black)
            .ignoresSafeArea()
        }
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}


struct RowLastChat: View {
    var chat: Chat
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
            VStack(alignment: .leading) {
                HStack {
                    Text(chat.name)
                    Spacer()
                    Text(timeFormat(date: chat.timestamp))
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                Text(chat.lastMessage)
                    .foregroundColor(.gray)
                    .font(.callout)
            }.foregroundColor(.white)
        }
    }
}
