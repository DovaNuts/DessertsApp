import SwiftUI

struct DessertDetailView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: DessertDetailViewModel
    
    init(id: String) {
        self.viewModel = DessertDetailViewModel(id: id)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Spacer()
                        RemoteImage(url: viewModel.dessert?.thumbnail.absoluteString ?? "")
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .cornerRadius(20)
                            .shadow(color: (isDarkMode ? Color.subtextDark : Color.subtext).opacity(0.2), radius: 5, x: 0, y: 2)
                        Spacer()
                    }
                    
                    // Name
                    Text(viewModel.dessert?.name ?? "")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(isDarkMode ? Color.textDark : Color.text)
                        .padding(.horizontal)
                    
                    // Tags
                    HStack {
                        if let tags = viewModel.dessert?.tags {
                            ForEach(tags, id: \.self) { tag in
                                Text(tag)
                                    .font(.body)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background((isDarkMode ? Color.secondaryDark : Color.secondary).opacity(0.3))
                                    .cornerRadius(15)
                                    .foregroundColor(isDarkMode ? Color.highlightDark : Color.highlight)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Ingredients
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Ingredients")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(isDarkMode ? Color.textDark : Color.text)
                        
                        if let ingredients = viewModel.dessert?.ingredients {
                            ForEach(ingredients, id: \.name) { ingredient in
                                Text("• \(ingredient.name) (\(ingredient.measure))")
                                    .foregroundColor(isDarkMode ? Color.subtextDark : Color.subtext)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Instructions
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Instructions")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(isDarkMode ? Color.textDark : Color.text)
                        
                        Text(viewModel.dessert?.instructions ?? "")
                            .foregroundColor(isDarkMode ? Color.textDark : Color.text)
                    }
                    .padding(.horizontal)
                }
                .background(isDarkMode ? Color.backgroundDark : Color.background)
                .padding(.top, 20)
                .toolbar {
                    ToolbarItem {
                        Button {
                            dismiss()
                        } label: {
                            Text("X")
                                .bold()
                                .foregroundColor(Color.subtextDark)
                        }
                    }
                }
            }
        }
        
    }
}


struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailView(id: "0")
    }
}
