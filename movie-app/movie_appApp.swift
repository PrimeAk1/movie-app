//
//  movie_appApp.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 04. 12..
//

import SwiftUI

@main
struct movie_appApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @AppStorage("color-scheme") var colorScheme: Theme = .light
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .preferredColorScheme(ColorScheme(theme: colorScheme))
        }
    }
}
