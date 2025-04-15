//
//  FetchGenreRequest.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 04. 12..
//


struct FetchGenreRequest {
    let accesToken: String = Config.bearerToken
    
    func asRequestParams() -> [String: String] {
        return [:]
    }
}
