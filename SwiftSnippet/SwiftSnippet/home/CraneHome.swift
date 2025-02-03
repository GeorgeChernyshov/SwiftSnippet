import SwiftUI

enum CraneScreen: String {
    case fly
    case sleep
    case eat
}

struct CraneHome: View {
    var body: some View {
        CraneHomeContent()
            .background(.cranePurple800)
    }
}

struct CraneHomeContent: View {
    @StateObject var viewModel = MainViewModel()
    @State var tabSelected = CraneScreen.fly
    
    var body: some View {
        VStack {
            HomeTabBar(
                openDrawer: {},
                tabSelected: tabSelected,
                onTabSelected: { tab in tabSelected = tab }
            )
            .frame(maxWidth: .infinity)
            
            ExploreSection(
                title: "Explore Restaurants by Destination",
                exploreList: $viewModel.restaurants
            )
            .background(
                RoundedRectangle(cornerRadius: 20).fill(.craneWhite)
            )
        }
    }
}

struct HomeTabBar: View {
    let openDrawer: () -> ()
    var tabSelected: CraneScreen
    let onTabSelected: (CraneScreen) -> ()
    
    var body: some View {
        CraneTabBar(
            onMenuClicked: openDrawer,
            children: CraneTabs(
                titles: [
                    CraneScreen.fly,
                    CraneScreen.sleep,
                    CraneScreen.eat
                ],
                tabSelected: tabSelected,
                onTabSelected: onTabSelected
            )
        )
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CraneHome()
}

#Preview {
    CraneHomeContent()
}
