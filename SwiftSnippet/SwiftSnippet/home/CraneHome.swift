import SwiftUI

enum CraneScreen: String {
    case fly
    case sleep
    case eat
}

struct CraneHome: View {
    @State var isDrawerOpen: Bool = false
    
    var body: some View {
        ZStack {
            CraneHomeContent(openDrawer: {
                isDrawerOpen = true
            })
            .background(.cranePurple800)
            
            NavigationDrawer(
                isOpen: $isDrawerOpen,
                content: CraneDrawer()
            )
        }
    }
}

struct CraneHomeContent: View {
    @StateObject var viewModel = MainViewModel()
    @State var tabSelected = CraneScreen.fly
    
    let openDrawer: () -> ()
    
    let onPeopleChanged: (Int) -> () = { people in
    }
    
    var body: some View {
        BackdropScaffold(
            appBar: {
                HomeTabBar(
                    openDrawer: self.openDrawer,
                    tabSelected: tabSelected,
                    onTabSelected: { tab in tabSelected = tab }
                )
                .frame(maxWidth: .infinity)
            },
            backContent: {
                SearchContent(
                    tabSelected: self.tabSelected,
                    viewModel: self.viewModel,
                    onPeopleChanged: self.onPeopleChanged
                )
            },
            frontContent: {
                switch(tabSelected) {
                case CraneScreen.fly:
                    ExploreSection(
                        title: "Explore Flights by Destination",
                        exploreList: $viewModel.suggestedDestinations
                    )
                case CraneScreen.sleep:
                    ExploreSection(
                        title: "Explore Properties by Destination",
                        exploreList: $viewModel.hotels
                    )
                case CraneScreen.eat:
                    ExploreSection(
                        title: "Explore Restaurants by Destination",
                        exploreList: $viewModel.restaurants
                    )
                }
            }
        )
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

struct SearchContent: View {
    
    let tabSelected: CraneScreen
    let viewModel: MainViewModel
    let onPeopleChanged: (Int) -> ()
    
    var body: some View {
        FlySearchContent(
            onPeopleChanged: self.onPeopleChanged,
            onToDestinationChanged: { destination in }
        )
    }
}

#Preview {
    CraneHome()
}

#Preview {
    CraneHomeContent(openDrawer: {})
}
