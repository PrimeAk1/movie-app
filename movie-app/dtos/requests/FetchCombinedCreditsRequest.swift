//
//  FetchCombinedCredits.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 07. 13..
//

struct FetchCombinedCreditsRequest: LocalizedRequestable {
    let accessToken: String = Config.bearerToken
    let personId: Int
    
    func asRequestParams() -> [String: Any] {
        return languageParam
    }
}
