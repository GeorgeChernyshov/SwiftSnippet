import SwiftUI

struct ExploreSection: View {
    @Binding var exploreList: [ExploreModel]
    
    var body: some View {
        ExploreList(exploreList: $exploreList)
    }
}

struct ExploreList: View {
    @Binding var exploreList: [ExploreModel]
    
    var body: some View {
        List($exploreList) { $item in
            ExploreItem(item: $item)
        }
    }
}

struct ExploreItem: View {
    @Binding var item: ExploreModel
    
    var body: some View {
        VStack {
            Text(item.city.getNameToDisplay())
                .font(.subheadline)
                .padding(.bottom, 8)
            
            Text(item.description)
                .font(.caption)
                .foregroundStyle(.craneCaption)
        }
    }
}
