//
//  SearchMovieRequest.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 04. 28..
//


struct SearchMediaItemRequest {
    let accessToken: String = Config.bearerToken
    let query: String
    
    func asRequestParams() -> [String: Any] {
        return [
            "query": query
        ]
    }
} 
