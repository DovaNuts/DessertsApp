import Combine
import Foundation

class DessertListViewModel: ObservableObject {
    @Published var desserts: [Dessert] = []
    @Published var selectedDessert: Dessert?

    @Published var searchText: String = ""

    private var cancellables: Set<AnyCancellable> = []

    var searchResults: [Dessert] {
        if searchText.isEmpty {
            return desserts
        } else {
            return desserts.filter { $0.name.contains(searchText) }
        }
    }

    init() {
        fetchDesserts()
    }

    func cleanCache() {
        ImageCache.shared.clean()
        fetchDesserts()
    }

    private func fetchDesserts(networkManager: NetworkManager = .shared) {
        networkManager.fetchDesserts()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print("Failed to fetch desserts: \(error)")
                }
            } receiveValue: { [weak self] receivedValue in
                self?.desserts = receivedValue.meals.map { dessert in
                    return Dessert(name: dessert.strMeal, image: dessert.strMealThumb, mealID: dessert.idMeal)
                }.sorted { $0.name < $1.name }
            }
            .store(in: &cancellables)
    }
}
