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
    
    init() {
        UITableView.appearance().backgroundColor = .purple
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(chats) { chat in
                        NavigationLink(
                            destination: ChattingView(),
                            label: {
                               HStack {
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 30, height: 30)
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
                                }
                               }
                            })
                    }
                }.background(Color.purple)
            }.navigationBarTitle("Chats", displayMode: .inline)
        }
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

