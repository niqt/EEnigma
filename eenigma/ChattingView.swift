//
//  ChattingView.swift
//  eenigma
//
//  Created by Nicola De Filippo on 06/10/24.
//

import SwiftUI

struct ChattingView: View {
    @State var chats: Array<Chat> =
    [Chat(name: "Alice", image: "person", lastMessage: "Bye", timestamp: Date(), chatId: "1"),
     Chat(name: "Bob", image: "person", lastMessage: "See soon", timestamp: Date(), chatId: "2")
    ]
    
    @State var writing: String = ""
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
        VStack(spacing: 0) {
            // Chat
            Spacer()
            List {
                ForEach(chats) { chat in
                    if chat.name == "Bob" {
                        UserRowView(chat: chat)
                        
                    } else {
                        ChatRowView(chat: chat)
                    }
                }.listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }.scrollContentBackground(.hidden)
            .navigationBarTitle("Chatting", displayMode: .inline)
            .onTapGesture {
                self.endEditing()
                
            }
            // Input
            HStack() {
                TextEditor(text: $writing)
                    .frame(minHeight: 0, maxHeight: 50)
                    .border(Color.gray)
                
                Button(action: {
                    chats.append(Chat(name: "Bob", image:"", lastMessage: writing, timestamp: Date(), chatId: ""))
                    writing = ""
                    self.endEditing()
                }) {
                    Image(systemName: "paperplane")
                }
                
            }.ignoresSafeArea(.keyboard, edges: .bottom)
            .padding()
        }.background(Color.black)
    }
    private func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
    }
}


struct ChatRowView: View {
    var chat: Chat
    var body: some View {
        VStack (alignment: .trailing){
            HStack() {
                Image(systemName: chat.image)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
                Text(chat.lastMessage)
                Spacer()
            }.frame(maxWidth: 200)
            Text(timeFormat(date: chat.timestamp))
                .padding(2)
                .font(.caption)
                .foregroundStyle(.white)
        }.background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct UserRowView: View {
    var chat: Chat
    var body: some View {
        HStack {
            Spacer()
            VStack (alignment: .trailing){
                HStack() {
                    Spacer()
                    HStack {
                        Spacer()
                        Text(chat.lastMessage)
                            .padding()
                    }
                }
                Text(timeFormat(date: chat.timestamp))
                    .padding(2)
                    .font(.caption)
                    .foregroundStyle(.white)
            }.background(Color.green)
            .frame(minWidth: 10, maxWidth: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

func timeFormat(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: date)
}

func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

#Preview {
    ChattingView()
}
