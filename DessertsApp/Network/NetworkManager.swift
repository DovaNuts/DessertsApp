import Combine
import Foundation

class NetworkManager {
    static let instance = NetworkManager()
    private let apiClient = APIClient()
    
    func fetchDesserts() -> AnyPublisher<APIMeals, Error> {
        return apiClient.request(APIEndpoint.getDesserts)
    }

    func fetchMealDetails(withID id: String) -> AnyPublisher<APIMealsDetails, Error> {
        return apiClient.request(APIEndpoint.getMealDetails(id: id))
    }
}
