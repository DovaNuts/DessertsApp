import SwiftUI

struct DessertItemRowView: View {

    let name: String
    let imageUrl: String

    var body: some View {
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
        Text(name)
            .foregroundColor(Color.text)
            .font(.headline)
            .fontWeight(.medium)
    }

    @ViewBuilder
    private var thumbnailImage: some View {
        CachedAsyncImage(urlString: imageUrl)
            .aspectRatio(contentMode: .fit)
            .frame(height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(Color.secondary.opacity(0.2), lineWidth: 1))
            .shadow(color: Color.highlight.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

struct DessertView_Previews: PreviewProvider {
    static var previews: some View {
        DessertItemRowView(name: "Dessert", imageUrl: "")
    }
}
