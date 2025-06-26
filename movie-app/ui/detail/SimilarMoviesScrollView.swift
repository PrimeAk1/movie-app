
import SwiftUI

struct SimilarMoviesScrollView: View {
    let movies: [MediaItem]

    var body: some View {
        VStack(alignment: .leading, spacing: LayoutConst.normalPadding) {
            Text("detail.similars.text".localized())
                .font(.title2)
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: LayoutConst.smallPadding) {
                    ForEach(movies) { movie in
                        NavigationLink(destination: DetailView(mediaItem: movie)) {
                            MediaItemCell(movie: movie)
                                .frame(width: 211)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        .padding(.bottom, 80)
    }
}
