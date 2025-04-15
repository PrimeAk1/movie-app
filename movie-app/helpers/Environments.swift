//
//  Environments.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 04. 12..
//

import Foundation

struct Environment {
    
    enum Name {
        case prod
        case dev
    }

    enum Variant {
        case movie
        case tv
    }
    
    #if ENV_PROD
    static let name: Name = .prod
    #else
    static let name: Name = .dev
    #endif

    static let variant: Variant = {
        let raw = ProcessInfo.processInfo.environment["APP_VARIANT"] ?? "movie"
        return raw.lowercased() == "tv" ? .tv : .movie
    }()
}
