


struct FetchCastMemberDetailRequest: LocalizedRequestable {
    let accessToken: String = Config.bearerToken
    let castMemberId: Int
    
    func asRequestParams() -> [String: Any]{
        return languageParam
    }
}
