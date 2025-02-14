import SwiftUI

struct CraneTabBar : View {
    let onMenuClicked: () -> ()
    let children: CraneTabs
    
    var body: some View {
        HStack {
            HStack(spacing: 0) {
                Image(.icMenu)
                    .padding(.top, 8)
                    .onTapGesture { onMenuClicked() }
                
                Image(.craneLogo)
                    .padding(.leading, 8)
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
                let selected = (item == tabSelected)
                let textView = Text(item.rawValue.localizedUppercase)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .font(.headline)
                    .foregroundStyle(.craneWhite)
                    .onTapGesture {
                        onTabSelected(item)
                    }
                
                if selected {
                    textView
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.craneWhite, lineWidth: 2)
                        )
                } else {
                    textView
                }
                
                Spacer()
            }
        }
    }
}
