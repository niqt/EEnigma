//
//  ContentView.swift
//  eenigma
//
//  Created by Nicola De Filippo on 06/10/24.
//

import SwiftUI

struct ContentView: View {
    
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
        TabView {
            Tab("Contacts", systemImage: "rectangle.stack.person.crop.fill") {
                NavigationStack {
                    ContactsView()
                        .navigationBarTitle("Contacts", displayMode: .inline)
                }
            }
            Tab("Chat", systemImage: "message.fill") {
                NavigationStack {
                    ChatsView()
                }
            }.badge(3)
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
