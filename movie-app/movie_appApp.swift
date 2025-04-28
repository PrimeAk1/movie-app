//
//  movie_appApp.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 04. 12..
//

import SwiftUI

@main
struct movie_app_liveApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
