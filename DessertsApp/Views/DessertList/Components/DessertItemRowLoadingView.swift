import SwiftUI

public struct DessertItemRowLoadingView: View {

    private struct Constants {
        static let duration: Double = 0.9
        static let minOpacity: Double = 0.25
        static let maxOpacity: Double = 1.0
        static let cornerRadius: CGFloat = 2.0
    }

    @State private var opacity: Double = Constants.minOpacity

    public var body: some View {
        content
    }

    @ViewBuilder
    private var content: some View {
        HStack(spacing: 20) {
            nameText
            Spacer()
            thumbnailImage
        }
    }

    @ViewBuilder
    private var nameText: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .fill(Color.placeholder)
            .opacity(opacity)
            .transition(.opacity)
            .frame(width: 150, height: 20)
            .cornerRadius(6)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    self.opacity = Constants.maxOpacity
                }
            }
    }

    @ViewBuilder
    private var thumbnailImage: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .fill(Color.placeholder)
            .opacity(opacity)
            .transition(.opacity)
            .frame(width: 100, height: 100)
            .cornerRadius(16)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    self.opacity = Constants.maxOpacity
                }
            }
    }
}
