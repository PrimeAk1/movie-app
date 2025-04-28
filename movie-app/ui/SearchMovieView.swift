//
//  SearchMovieView.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 04. 20..
//

import SwiftUI
import InjectPropertyWrapper

class SearchMovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var query: String = ""
    
    @Inject
    private var service: MoviesServiceProtocol
    
    func search() async {
        guard !query.isEmpty else { return }

        do {
            let request = FetchMoviesRequest(genreId: nil, query: query)
            let result = try await service.searchMovie(req: request)
            DispatchQueue.main.async {
                self.movies = result
            }
        } catch {
            print("Search error: \(error)")
        }
    }
}

struct SearchMovieView: View {
    @StateObject private var viewModel = SearchMovieViewModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 16)
    ]

    var body: some View {
        NavigationView {
            VStack {
                TextField("Keresés filmre...", text: $viewModel.query)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button("Keresés") {
                    Task {
                        await viewModel.search()
                    }
                }
                .padding(.bottom)

                if viewModel.movies.isEmpty {
                    Text("Nincs találat")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 24) {
                            ForEach(viewModel.movies) { movie in
                                MovieCellView(movie: movie)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Keresés")
        }
    }
}
