import Foundation

class MainViewModel: ObservableObject {
    private let destinationsRepository = DI.destinationsRepository
    
    @Published var suggestedDestinations: [ExploreModel]
    @Published var hotels: [ExploreModel]
    @Published var restaurants: [ExploreModel]
    
    init() {
        suggestedDestinations = destinationsRepository.destinations
        hotels = destinationsRepository.hotels
        restaurants = destinationsRepository.restaraunts
    }
}
