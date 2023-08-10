import Combine
import Foundation

class DessertListViewModel: ObservableObject {
    @Published var desserts: [Dessert] = []
    @Published var selectedDessert: Dessert?

    @Published var searchText: String = ""

    @Published var loading: Bool = true
    @Published var hasError: Bool = false

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

    func fetchDesserts(networkManager: NetworkManager = .shared) {
        hasError = false
        loading = true

        networkManager.fetchDesserts()
            .receive(on: DispatchQueue.main)
            .timeout(10, scheduler: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.loading = false

                    if case .failure(let error) = completion {
                        self?.hasError = true
                        print("Failed to fetch desserts: \(error)")
                    }
                },
                receiveValue: { [weak self] receivedValue in
                    self?.desserts = receivedValue.meals.map { dessert in
                        return Dessert(name: dessert.strMeal, image: dessert.strMealThumb, mealID: dessert.idMeal)
                    }.sorted { $0.name < $1.name }
                }
            )
            .store(in: &cancellables)
    }
}
