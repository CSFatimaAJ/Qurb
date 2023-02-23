//
//  QurbApp.swift
//  Qurb
//
//  Created by Saja Alhimiary on 08/02/2023.
//

import SwiftUI
import FirebaseCore
import Firebase
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()


    return true
  }
}
@main
struct QurbApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            Splash()
        //    RatingView()
          //  HomePage()
        }
    }
}
