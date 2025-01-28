class MainViewModel {
    private let destinationsRepository = DI.destinationsRepository
    
    var restaurants: [ExploreModel]
    
    init() {
        restaurants = destinationsRepository.restaraunts
    }
}
