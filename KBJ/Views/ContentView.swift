//
//  ContentView.swift
//  KBJ
//
//  Created by Other user on 6/11/21.
//

import SwiftUI
import Firebase
struct ContentView: View {
    @State private var selection = 0
    @State var show = false
    let db = Firestore.firestore()
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                        //.foregroundColor(.black)
                        .onAppear {
                            db.collection("z-accept").addSnapshotListener { querySnapshot, error in
                                if let e = error {
                                    //
                                    print(e)
                                } else {
                                    //staff = ["found documents"]
                                    if let snapshotDocuments = querySnapshot?.documents {
                                        //staff = ["got inside"]
                                        for doc in snapshotDocuments {
                                            //staff = ["even farther"]
                                            let data = doc.data()
                                            if let remote = data["today"] as? Bool{
                                                show = remote
                                            }
                                        }
                                    }
                                }
                            }
                        }
                }
//                .tag(0)
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                    //.foregroundColor(.black)
                }
//                .tag(1)
            if show == true {
                OrderView()
                    .tabItem {
                        Label("Order", systemImage: "cart.fill")
                        //.foregroundColor(.black)
                    }
//                    .tag(2)
            }
            CrewView()
                .tabItem {
                    Label("Crew", systemImage: "person.fill")
                    //.foregroundColor(.black)
                }
//                .tag(3)
            
            DealsView()
                .tabItem {
                    Label("Deals", systemImage: "dollarsign.square.fill")
                    //.foregroundColor(.black)
                }
//                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
