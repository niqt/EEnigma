//
//  ContentView.swift
//  eenigma
//
//  Created by nicola on 24/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                ContactsView()
                    .navigationBarTitle("", displayMode: .inline)
            }
            .tabItem {  Label("Contacts", systemImage: "rectangle.stack.person.crop.fill")}
            ChatView()
                .tabItem {  Label("Chat", systemImage: "message.fill")}
            SettingView()
                .tabItem {  Label("Settings", systemImage: "gear")}
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
