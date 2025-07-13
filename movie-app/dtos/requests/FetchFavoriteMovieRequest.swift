//
//  FetchFavoriteMovieRequest.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 05. 12..
//


struct FetchFavoriteMediaItemRequest: LocalizedRequestable {
    let accessToken: String = Config.bearerToken
    let accountId: Int = Config.accountId
    
    func asRequestParams() -> [String: Any] {
        return languageParam
    }
}
