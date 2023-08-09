import Combine
import Foundation

class DessertDetailViewModel: ObservableObject {
    @Published var dessert: DessertDetails?
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(id: String) {
        NetworkManager.instance.fetchMealDetails(withID: id)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print("Failed to fetch dessert details: \(error)")
                }
            } receiveValue: { [weak self] receivedValue in
                guard let dessertDetails = receivedValue.meals.first else { return }
                self?.dessert = DessertDetails(from: dessertDetails)
            }
            .store(in: &cancellables)
    }
}
