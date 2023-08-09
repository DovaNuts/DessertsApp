import Foundation

struct APIMeals: Codable {
    var meals: [APIDessert]
}

struct APIMealsDetails: Codable {
    var meals: [APIDessertDetails]
}

struct APIDessert: Codable {
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}

struct APIDessertDetails: Codable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    
    var ingredientsList: [APIIngredient] {
        let names = extractProperties(prefix: "strIngredient")
        let measures = extractProperties(prefix: "strMeasure")
        
        return Array(zip(names, measures)).map { APIIngredient(name: $0.0, measure: $0.1) }
    }
    
    private func extractProperties(prefix: String) -> [String] {
        let mirror = Mirror(reflecting: self)
        var results: [String] = []
        
        for child in mirror.children {
            if let label = child.label, label.hasPrefix(prefix), let value = child.value as? String, !value.isEmpty {
                results.append(value)
            }
        }
        return results
    }
}

struct APIIngredient {
    let name: String
    let measure: String
}
