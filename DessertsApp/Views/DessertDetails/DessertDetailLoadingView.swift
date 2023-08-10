import SwiftUI

public struct DessertDetailLoadingView: View {

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
            VStack(alignment: .leading, spacing: 20) {
                thumbnailImage
                dessertNameText
                tagList
                ingredientsAndMeasuresList
                Spacer()
            }
    }

    @ViewBuilder
    private var thumbnailImage: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .fill(Color.placeholder)
            .opacity(opacity)
            .transition(.opacity)
            .frame(width: 350, height: 350)
            .cornerRadius(20)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    self.opacity = Constants.maxOpacity
                }
            }
    }

    @ViewBuilder
    private var dessertNameText: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .fill(Color.placeholder)
            .opacity(opacity)
            .transition(.opacity)
            .frame(width: 250, height: 50)
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
    private var tagList: some View {
        HStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(Color.placeholder)
                .opacity(opacity)
                .transition(.opacity)
                .frame(width: 50, height: 30)
                .cornerRadius(15)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    withAnimation(repeated) {
                        self.opacity = Constants.maxOpacity
                    }
                }
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(Color.placeholder)
                .opacity(opacity)
                .transition(.opacity)
                .frame(width: 50, height: 30)
                .cornerRadius(15)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    withAnimation(repeated) {
                        self.opacity = Constants.maxOpacity
                    }
                }
        }
    }

    @ViewBuilder
    private var ingredientsAndMeasuresList: some View {
        VStack(alignment: .leading, spacing: 10) {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(Color.placeholder)
                .opacity(opacity)
                .transition(.opacity)
                .frame(width: 200, height: 20)
                .cornerRadius(6)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    withAnimation(repeated) {
                        self.opacity = Constants.maxOpacity
                    }
                }
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(Color.placeholder)
                .opacity(opacity)
                .transition(.opacity)
                .frame(width: 200, height: 20)
                .cornerRadius(6)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    withAnimation(repeated) {
                        self.opacity = Constants.maxOpacity
                    }
                }
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(Color.placeholder)
                .opacity(opacity)
                .transition(.opacity)
                .frame(width: 200, height: 20)
                .cornerRadius(6)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    withAnimation(repeated) {
                        self.opacity = Constants.maxOpacity
                    }
                }
        }
    }

}
