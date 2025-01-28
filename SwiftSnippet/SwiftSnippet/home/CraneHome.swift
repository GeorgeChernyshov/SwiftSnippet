import SwiftUI

struct CraneHome: View {
    var body: some View {
        CraneHomeContent()
    }
}

struct CraneHomeContent: View {
//    @State var viewModel = MainViewModel()
    
    @State var restaurants = DestinationsLocalDataSource().craneRestaurants
    
    var body: some View {
        VStack {
            HomeTabBar()
            ExploreSection(exploreList: $restaurants)
        }
        .padding()
    }
}

struct HomeTabBar: View {
    var body: some View {
        Text("Hello")
    }
}

#Preview {
    CraneHome()
}

#Preview {
    CraneHomeContent()
}
