

import SwiftUI

enum GenreType {
    case movie, tv
}


class GenreSectionViewModel: ObservableObject {
    @Published var genres: [Genre] = []

    private var movieService: MoviesServiceProtocol = MoviesService()

    func fetchGenres(type: GenreType = .movie) async {
        do {
            let request = FetchGenreRequest()
            let genres: [Genre]
            
            switch type {
            case .movie:
                genres = try await movieService.fetchGenres(req: request)
            case .tv:
                genres = try await movieService.fetchTvGenres(req: request)
            }

            DispatchQueue.main.async {
                self.genres = genres
            }
        } catch {
            print("Error fetching genres: \(error)")
        }
    }
}

    struct GenreSectionView: View {
        
        @StateObject private var viewModel = GenreSectionViewModel()
        
        var body: some View {
            NavigationView {
                List(viewModel.genres) { genre in
                    ZStack {
                        NavigationLink(destination: Color.gray) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        HStack {
                            Text(genre.name)
                                .font(Fonts.title)
                                .foregroundStyle(.primary)
                            Spacer()
                            Image(.rightArrow)
                        }
                        
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .navigationTitle(Environment.variant == .tv ? "TV" : "MOVIE")
                
            }
            .onAppear {
                Task {
                        let genreType: GenreType = (Environment.variant == .tv ? .tv : .movie)
                        await viewModel.fetchGenres(type: genreType)
                    }
            }
            
        }
        
    }
#Preview {
    GenreSectionView()
}
