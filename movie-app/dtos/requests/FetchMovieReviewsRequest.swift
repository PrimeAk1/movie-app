


import Foundation

struct FetchMovieReviewsRequest{
    let accessToken: String = Config.bearerToken
    let mediaId: Int
    
    func asRequestParams() -> [String: Any]{
        return [:]
    }
} 
