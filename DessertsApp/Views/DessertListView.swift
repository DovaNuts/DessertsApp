//
//  ContentView.swift
//  DessertsApp
//
//  Created by Axel Gonzalez on 08/08/23.
//

import SwiftUI

struct DessertListView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @ObservedObject var viewModel = DessertListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.searchResults, id: \.id) { dessert in
                    DessertItemRowView(name: dessert.name, imageUrl: dessert.image)
                        .onTapGesture {
                            viewModel.selectedDessert = dessert
                        }
                }
            }
            .navigationTitle("Desserts")
            .navigationBarTitleDisplayMode(.inline)
            .background(isDarkMode ? Color.backgroundDark : Color.background)
            .scrollContentBackground(.hidden)
            .sheet(item: $viewModel.selectedDessert) { selectedDessert in
                DessertDetailView(id: selectedDessert.id)
                    .background(isDarkMode ? Color.backgroundDark : Color.background)
            }
            .toolbar {
                Toggle("Dark mode", isOn: $isDarkMode)
            }
        }
        .searchable(text: $viewModel.searchText)
    }
}

struct DessertsListView_Previews: PreviewProvider {
    static var previews: some View {
        DessertListView()
    }
}
