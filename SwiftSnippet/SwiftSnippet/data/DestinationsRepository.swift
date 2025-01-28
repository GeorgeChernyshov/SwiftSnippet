class DestinationsRepository {
    private let destinationsLocalDataSource = DI.destinationsLocalDataSource
    
    let restaraunts: [ExploreModel]
    
    init() {
        restaraunts = destinationsLocalDataSource.craneRestaurants
    }
}
