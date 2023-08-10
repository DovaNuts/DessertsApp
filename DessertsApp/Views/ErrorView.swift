import SwiftUI

struct ErrorView: View {
    let retryCallback: (() -> Void)

    var body: some View {
        VStack(spacing: 20) {
            Text("Something went wrong")
                .font(.title3)
                .tint(Color.text)

            Button {
                retryCallback()
            } label: {
                Text("Try again")
                    .font(.callout)
                    .frame(width: 150, height: 40)
                    .background(Color.button)
                    .tint(Color.text)
                    .cornerRadius(20)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(retryCallback: {})
    }
}
