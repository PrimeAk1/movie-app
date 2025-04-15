//
//  Genre.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 04. 12..
//


struct Genre: Identifiable, Hashable, Equatable {
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    init(dto: GenreResponse) {
        self.id = dto.id
        self.name = dto.name
    }
}
