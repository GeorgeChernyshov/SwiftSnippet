struct City {
    let name: String
    let country: String
    let latitude: String
    let longitude: String
    
    func getNameToDisplay() -> String {
        return "\(name), \(country)"
    }
}

struct ExploreModel {
    let city: City
    let description: String
    let imageUrl: String
}
