import SwiftUI

struct CraneTabBar : View {
    let onMenuClicked: () -> ()
    let children: CraneTabs
    
    var body: some View {
        HStack {
            HStack {
                Image(.craneLogo)
            }
            .padding(.top, 8)
            
            children.frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
    }
}

struct CraneTabs : View {
    let titles: [CraneScreen]
    var tabSelected: CraneScreen
    let onTabSelected: (CraneScreen) -> ()
    
    var body: some View {
        HStack {
            Spacer()
            
            ForEach(titles, id: \.rawValue) { item in
                Text(item.rawValue.localizedUppercase)
                Spacer()
            }
        }
    }
}
