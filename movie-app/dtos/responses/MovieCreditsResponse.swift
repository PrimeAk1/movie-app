


import Foundation

struct MovieCreditsResponse: Codable {
    let id: Int
    let cast: [CastMemberResponse]
    
    enum CodingKeys: String, CodingKey {
        case id
        case cast
    }
}
