


import SwiftUI

struct ReviewCell: View {
    let review: MediaItemReview
    
    var body: some View {
        VStack(alignment: .leading, spacing: LayoutConst.smallPadding) {
            HStack {
                Text(review.author)
                    .font(Fonts.subheading)
                Spacer()
                if let rating = review.rating {
                    MediaItemLabel(type: .rating(rating))
                }
            }
            Text(review.content)
                .font(Fonts.paragraph)
                .lineLimit(4)
        }
    }
} 
