//
//  ContentView.swift
//  KBJ
//
//  Created by Other user on 6/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                        //.foregroundColor(.black)
                }
                .tag(0)
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                        //.foregroundColor(.black)
                }
                .tag(1)
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "cart.fill")
                        //.foregroundColor(.black)
                }
                .tag(2)
            CrewView()
                .tabItem {
                    Label("Crew", systemImage: "person.fill")
                        //.foregroundColor(.black)
                }
                .tag(3)
           
            DealsView()
                .tabItem {
                    Label("Deals", systemImage: "dollarsign.square.fill")
                        //.foregroundColor(.black)
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
