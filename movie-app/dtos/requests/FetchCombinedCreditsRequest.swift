//
//  FetchCombinedCreditsRequest.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 06. 29..
//

struct FetchCombinedCreditsRequest {
    let accessToken: String = Config.bearerToken
    let personId: String
    
    func asRequestParams() -> [String: Any] {
        return [:]
    }
}
