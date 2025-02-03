import SwiftUI

struct ExploreSection: View {
    let title: String
    
    @Binding var exploreList: [ExploreModel]
    
    var body: some View {
        VStack {
            Text(title).font(.caption)
                .foregroundStyle(.craneCaption)
                .padding(.bottom, 8)
            
            ExploreList(exploreList: $exploreList)
        }
        .padding(.horizontal, 24)
        .padding(.top, 20)
    }
}

struct ExploreList: View {
    @Binding var exploreList: [ExploreModel]
    
    var body: some View {
        List($exploreList) { $item in
            VStack(alignment: .leading) {
                ExploreItem(item: $item)
                Divider().overlay(.craneDivider)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
    }
}

struct ExploreItem: View {
    @Binding var item: ExploreModel
    
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: item.imageUrl),
                scale: 1,
                transaction: Transaction(animation: .default)
            ) { image in
                switch image {
                case .success(let img):
                    img.resizable()
                default:
                    ZStack {
                        Rectangle().fill(.cranePurple900)
                        Image(.craneLogo).frame(width: 36, height: 36)
                    }
                }
            }
            .frame(width: 60, height: 60)
            .cornerRadius(4)
            .padding(.trailing, 24)
            
            VStack(alignment: .leading) {
                Text(item.city.getNameToDisplay())
                    .font(.subheadline)
                    .padding(.bottom, 8)
                
                Text(item.description)
                    .font(.caption)
                    .foregroundStyle(.craneCaption)
            }
        }
        .padding(.horizontal, 12)
    }
}
