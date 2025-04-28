//
//  MainTabView.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 04. 20..
//


import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // 1. Műfajok tab
            NavigationView {
                GenreSectionView()
            }
            .tabItem {
                Label("Műfajok", systemImage: "film")
            }
            
            // 2. Keresés tab
            NavigationView {
                SearchMovieView()
            }
            .tabItem {
                Label("Keresés", systemImage: "magnifyingglass")
            }
        }
    }
}

#Preview {
    MainTabView()
}