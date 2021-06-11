//
//  ContentView.swift
//  KBJ
//
//  Created by Other user on 6/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            CrewView()
                .tabItem {
                    Label("Crew", systemImage: "person.fill")
                        //.foregroundColor(.black)
                }
                .tag(0)
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                        //.foregroundColor(.black)
                }
                .tag(1)
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                        //.foregroundColor(.black)
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
