//
//  FetchDetailRequest.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 05. 12..
//


struct FetchDetailRequest: LocalizedRequestable {
    let accessToken: String = Config.bearerToken
    let mediaId: Int
    
    func asRequestParams() -> [String: Any] {
        return languageParam
    }
}
