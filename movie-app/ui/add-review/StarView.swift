

import SwiftUI

struct StarView: View {
    let index: Int
    let isFilled: Bool
    var size: CGFloat = 40.0
    let onTap: () -> Void

    var body: some View {
        Image(isFilled ? .starFilled : .starUnfilled)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .onTapGesture {
                onTap()
            }
    }
    
    
}
