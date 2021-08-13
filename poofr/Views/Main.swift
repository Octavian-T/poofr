//
//  Main.swift
//  poofr
//
//  Created by Octavian Tabacaru on 10/08/2021.
//

import SwiftUI

struct Main: View {
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
    }

    var body: some View {
        TabView {
            RoomView()
                .tabItem {
                    Image(systemName: "person")
                }
            MessagesView()
                .tabItem {
                    Image(systemName: "message")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "house")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
        } //tabview
    } //body
} // struct

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
