class DestinationsRepository {
    private let destinationsLocalDataSource = DI.destinationsLocalDataSource
    
    let destinations: [ExploreModel]
    let hotels: [ExploreModel]
    let restaraunts: [ExploreModel]
    
    init() {
        destinations = destinationsLocalDataSource.craneDestinations
        hotels = destinationsLocalDataSource.craneHotels
        restaraunts = destinationsLocalDataSource.craneRestaurants
    }
}
