//
//  FetchMovieRequest.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 04. 15..
//

struct FetchMoviesRequest {
    let accessToken: String = Config.bearerToken
    var genreId: Int? = nil
    var query: String? = nil
    
    func asRequestParams() -> [String: Any] {
        var params: [String: Any] = [:]
        
        if let genreId = genreId {
            params["with_genres"] = genreId
        }
        
        if let query = query {
            params["query"] = query
        }
        
        return params
    }
}

