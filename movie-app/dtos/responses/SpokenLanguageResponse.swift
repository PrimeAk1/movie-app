//
//  SpokenLanguageResponse.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 05. 12..
//


struct SpokenLanguageResponse: Decodable {
    let englishName: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case name
    }
}
