//
//  ContentView.swift
//  eenigma
//
//  Created by nicola on 24/05/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = UIColor.white
        
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().barTintColor = UIColor.black
    }
    var body: some View {
        TabView {
            NavigationView {
                ContactsView()
                    .navigationBarTitle("Contacts", displayMode: .automatic)
                
            }
            .tabItem {  Label("Contacts", systemImage: "rectangle.stack.person.crop.fill")}
            
            ChatsView()
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
