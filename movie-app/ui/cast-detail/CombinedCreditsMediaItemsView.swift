//
//  MediaItemListView.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 06. 29..
//

import SwiftUI

struct CombinedCreditsMediaItemsView: View {
    let movies: [MediaItem]

    private let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 16)
    ]

    var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                Text("Movies & TV Shows")
                    .font(Fonts.caption)
                    .foregroundColor(.primary)
                    .padding(.horizontal)

                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(movies) { movie in
                        NavigationLink(destination: DetailView(mediaItem: movie)) {
                            MediaItemCell(movie: movie)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
        }
    }
