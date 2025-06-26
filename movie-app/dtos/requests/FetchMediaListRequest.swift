//
//  FetchMovieRequest.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 04. 15..
//


struct FetchMediaListRequest {
    let accessToken: String = Config.bearerToken
    let genreId: Int
    let includeAdult: Bool
    var page: Int = 1
    
    func asRequestParams() -> [String: Any] {
        return [
            "with_genres": genreId,
            "page": page
        ]
    }
}

