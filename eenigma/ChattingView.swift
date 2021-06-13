//
//  ChattingView.swift
//  eenigma
//
//  Created by nicola on 31/05/21.
//

import SwiftUI

struct ChattingView: View {
    @State var chats: Array<Chat> = [Chat(name: "Alice", image: "person", lastMessage: "Bye", timestamp: Date(), chatId: "1"),
                                     Chat(name: "Bob", image: "person", lastMessage: "See soon", timestamp: Date(), chatId: "2")
    ]
    
    @State var writing: String = ""
    
    init() {
        UITableView.appearance().backgroundColor = .none
        UITableViewCell.appearance().backgroundColor = .none
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Chat
            List {
                ForEach(chats) { chat in
                    if chat.name == "Bob" {
                        UserRowView(chat: chat)
                        
                    } else {
                        ChatRowView(chat: chat)
                    }
                }.listRowBackground(Color.clear)
            }.background(Color.black)
            .listStyle(SidebarListStyle())
            .ignoresSafeArea()
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
                }, label: {
                    Image(systemName: "paperplane")
                })
                
            }.ignoresSafeArea(.keyboard, edges: .bottom)
            .padding()
            .background(Color.black)
        }
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
                .foregroundColor(.white)
            
        }.background(Color.blue)
        .cornerRadius(10)
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
                    .foregroundColor(.white)
            }.background(Color.green)
            .frame(minWidth: 10, maxWidth: 200)
            .cornerRadius(10)
        }
    }
}

struct ChattingView_Previews: PreviewProvider {
    static var previews: some View {
        ChattingView()
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


