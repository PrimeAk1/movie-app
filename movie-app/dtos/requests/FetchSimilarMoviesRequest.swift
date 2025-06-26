


struct FetchSimilarMoviesRequest {
    let accessToken: String = Config.bearerToken
    let movieId: Int
    let page: Int = 1

    func asRequestParams() -> [String: Any] {
        return [
            "page": page
        ]
    }
}
