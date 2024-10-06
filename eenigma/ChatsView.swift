//
//  ChatsView.swift
//  eenigma
//
//  Created by Nicola De Filippo on 06/10/24.
//

import SwiftUI

struct ChatsView: View {
    var chats: Array<Chat> = [Chat(name: "Alice", image: "person", lastMessage: "Bye", timestamp: Date(), chatId: "1"), Chat(name: "Bob", image: "person", lastMessage: "See soon", timestamp: Date(), chatId: "2")
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
        VStack{
            NavigationStack {
                List {
                    ForEach(chats) { chat in
                        NavigationLink(destination: ChattingView()){
                            HStack {
                                Image(systemName: "person")
                                .resizable()
                                .frame(width: 30, height: 30)
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(chat.name)
                                        Spacer()
                                        Text(timeFormat(date: chat.timestamp))
                                        .foregroundStyle(.gray)
                                        .font(.footnote)
                                    }
                                    Text(chat.lastMessage)
                                    .foregroundStyle(.gray)
                                    .font(.callout)
                                }
                            }
                        }
                    }
                }.scrollContentBackground(.hidden).background(Color.black)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .navigationBarTitle("Chats", displayMode: .inline)
    }
}


struct RowLastChat: View {
    var chat: Chat
    var body: some View {
        HStack {
            Image(systemName: "person")
            .resizable()
            .frame(width: 30, height: 30)

            VStack(alignment: .leading) {
                HStack {
                    Text(chat.name)
                    Spacer()
                    Text(timeFormat(date: chat.timestamp))
                    .font(.footnote)
                }
                Text(chat.lastMessage)
                .font(.callout)
            }.foregroundStyle(.white)
        }
    }
}


#Preview {
    ChatsView()
}
