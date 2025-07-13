


struct FetchSimilarMoviesRequest: LocalizedRequestable {
    let accessToken: String = Config.bearerToken
    let movieId: Int
    var page: Int = 1

    func asRequestParams() -> [String: Any] {
        return [
            "page": page
        ] + languageParam
    }
}
