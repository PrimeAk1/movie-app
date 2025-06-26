//
//  GlobalMethods.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 04. 28..
//

import UIKit

func safeArea() -> UIEdgeInsets {
    (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
        .windows.first?.safeAreaInsets ?? .zero
}
