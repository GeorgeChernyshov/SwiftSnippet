import Foundation

struct City {
    let name: String
    let country: String
    let latitude: String
    let longitude: String
    
    func getNameToDisplay() -> String {
        return "\(name), \(country)"
    }
}

struct ExploreModel : Identifiable {
    let id: UUID
    let city: City
    let description: String
    let imageUrl: String
    
    init(
        id: UUID = UUID(),
        city: City,
        description: String,
        imageUrl: String
    ) {
        self.id = id
        self.city = city
        self.description = description
        self.imageUrl = imageUrl
    }
}
