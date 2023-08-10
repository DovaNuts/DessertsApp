import SwiftUI

struct DessertDetailView: View {

    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: DessertDetailViewModel

    init(id: String) {
        self.viewModel = DessertDetailViewModel(id: id)
    }

    var body: some View {
        NavigationView {
            content
            .padding(.horizontal)
            .background(Color.background)
            .toolbar { ToolbarItem { toolbarCloseButton } }
        }
    }

    @ViewBuilder
    private var content: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                thumbnailImage
                dessertNameText
                tagList
                ingredientsAndMeasuresList
                instructions
            }
        }
    }

    @ViewBuilder
    private var thumbnailImage: some View {
        HStack {
            Spacer()
            CachedAsyncImage(urlString: viewModel.dessert?.thumbnail.absoluteString ?? "")
                .scaledToFit()
                .frame(height: 350)
                .cornerRadius(20)
                .shadow(color: Color.subtext.opacity(0.2), radius: 5, x: 0, y: 2)
            Spacer()
        }
    }

    @ViewBuilder
    private var dessertNameText: some View {
        Text(viewModel.dessert?.name ?? "")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.text)
    }

    @ViewBuilder
    private var tagList: some View {
        HStack {
            if let tags = viewModel.dessert?.tags {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.body)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.secondary.opacity(0.3))
                        .cornerRadius(15)
                        .foregroundColor(Color.highlight)
                }
            }
        }
    }

    @ViewBuilder
    private var ingredientsAndMeasuresList: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Ingredients")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.text)

            if let ingredients = viewModel.dessert?.ingredients {
                ForEach(ingredients, id: \.name) { ingredient in
                    Text("• \(ingredient.name) (\(ingredient.measure))")
                        .foregroundColor(Color.subtext)
                }
            }
        }
    }

    @ViewBuilder
    private var instructions: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Instructions")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.text)

            Text(viewModel.dessert?.instructions ?? "")
                .foregroundColor(Color.text)
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
        }
    }

    @ViewBuilder
    private var toolbarCloseButton: some View {
        Button {
            dismiss()
        } label: {
            Text("X")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.subtext)
        }
    }
}

struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailView(id: "0")
    }
}
