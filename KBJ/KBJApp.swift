//
//  KBJApp.swift
//  KBJ
//
//  Created by Other user on 6/11/21.
//

import SwiftUI
import FirebaseCore
import FirebaseMessaging

class AppDelegate: NSObject, UIApplicationDelegate {
    
    // MARK: - Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
@main
struct Example_ProjectApp: App {
    
    // MARK: - Properties
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
    // MARK: - Life Cycle
    init() {
        FirebaseApp.configure()
    }
    // MARK: - UI Elements
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
