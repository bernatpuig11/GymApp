//
//  GymAppApp.swift
//  GymApp
//
//  Created by Gerard Burgués Llavall on 31/3/21.
//

import SwiftUI
import Firebase

@main
struct GymAppApp: App {
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        FirebaseApp.configure()
      }
    @State var show = false
    var body: some Scene {
        WindowGroup {
           // SplashScreen()
        
          
                HomeScreen()
            //ContentView()
        
        }
    }
}


//class AppDelegate: NSObject, UIApplicationDelegate {}
