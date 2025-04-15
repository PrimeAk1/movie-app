//
//  Environments.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 04. 12..
//

import Foundation

struct Environments {
    
    enum Name {
        case prod
        case dev
        case tv
    }

    
    #if ENV_PROD
    static let name: Name = .prod
    #elseif ENV_DEV
    static let name: Name = .dev
    #else
    static let name: Name = .tv
    #endif

}
