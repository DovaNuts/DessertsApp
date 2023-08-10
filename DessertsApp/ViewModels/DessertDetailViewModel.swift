import Combine
import Foundation

class DessertDetailViewModel: ObservableObject {
    @Published var dessert: DessertDetails?

    @Published var loading: Bool = false
    @Published var hasError: Bool = true

    private var id: String

    private var cancellables: Set<AnyCancellable> = []

    init(id: String) {
        self.id = id
        fetchDessertDetails()
    }

    func fetchDessertDetails(networkManager: NetworkManager = .shared) {
        hasError = false
        loading = true

        networkManager.fetchMealDetails(withID: id)
            .receive(on: DispatchQueue.main)
            .timeout(.seconds(5), scheduler: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.loading = false

                    if case .failure(let error) = completion {
                        self?.hasError = true
                        print("Failed to fetch dessert details: \(error)")
                    }
                },
                receiveValue: { [weak self] receivedValue in
                    guard let dessertDetails = receivedValue.meals.first else { return }
                    self?.dessert = DessertDetails(from: dessertDetails)
                }
            )
            .store(in: &cancellables)
    }
}
