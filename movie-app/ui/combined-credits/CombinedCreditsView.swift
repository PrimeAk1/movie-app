//
//  CombinedCreditsView.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 07. 13..
//

import SwiftUI

struct CombinedCreditsView: View {
    @StateObject private var viewModel = CombinedCreditsViewModel()
    let personId : Int

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
                    ForEach(viewModel.combinedCredits) { combinedCreditCast in
                        NavigationLink(destination: DetailView(mediaItem: MediaItem(credit: combinedCreditCast))) {
                            MediaItemCell(movie: MediaItem(credit: combinedCreditCast))
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                viewModel.personIdSubject.send(personId)
            }

        }
    }
