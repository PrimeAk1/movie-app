//
//  MoviesApi.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 04. 12..
//

import Foundation
import Moya

enum MoviesApi {
    case fetchGenres(req: FetchGenreRequest)
    case fetchTvGenres(req: FetchGenreRequest)
    case fetchMovies(req: FetchMoviesRequest)
}

extension MoviesApi: TargetType {
    //    TODO Másik base url
    var baseURL: URL {
        let baseUrl = "https://api.themoviedb.org/3/"
        guard let baseUrl = URL(string: baseUrl) else {
            preconditionFailure("Base url not valid url")
        }
        return baseUrl
    }
    
    var path: String {
        switch self {
        case .fetchGenres:
            return "genre/movie/list"
        case .fetchTvGenres:
            return "genre/tv/list"
        case .fetchMovies(req: let req):
            return "discover/movie"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchGenres, .fetchTvGenres, .fetchMovies:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case let .fetchGenres(req),
            let .fetchTvGenres(req):
            return .requestParameters(parameters: req.asRequestParams(), encoding: URLEncoding.queryString)
        case .fetchMovies(req: let req):
            return .requestParameters(parameters: req.asRequestParams(), encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        switch self {
        case let .fetchGenres(req),
            let .fetchTvGenres(req):
            return ["Authorization": req.accessToken]
        case let .fetchMovies(req):
            return ["Authorization": req.accessToken]
        }
    }
    
    
}
