//
//  SettingsView.swift
//  eenigma
//
//  Created by Nicola De Filippo on 06/10/24.
//

import SwiftUI

struct SettingsView: View {
    let messages: [String] = ["ddd"]

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
        Text("Settings")
    }
}


#Preview {
    SettingsView()
}
