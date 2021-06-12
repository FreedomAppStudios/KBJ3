//
//  KBJApp.swift
//  KBJ
//
//  Created by Other user on 6/11/21.
//

import SwiftUI
import Firebase
@main
struct KBJ: App {
    // MARK: - Life Cycle
    init() {
        FirebaseApp.configure()
        let db = Firestore.firestore()
    }
  
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
