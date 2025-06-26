//
//  FetchFavoriteMovieRequest.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 05. 12..
//


struct FetchFavoriteMovieRequest {
    let accessToken: String = Config.bearerToken
    let accountId: Int = 21889570
    
    func asRequestParams() -> [String: Any] {
        return [:]
    }
}
