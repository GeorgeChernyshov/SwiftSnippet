import SwiftUI

private let screens = [
    "Find Trips",
    "My Trips",
    "Saved Trips",
    "Price Alerts",
    "My Account"
]

struct CraneDrawer: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(.icCraneDrawer)
                .accessibilityLabel(String(localized: "cd_drawer"))
            
            ForEach(screens, id: \.self) { screen in
                Text(screen)
                    .padding(.top, 24)
                    .font(.largeTitle)
                    .foregroundStyle(.craneWhite)
            }
        }
        .padding(.leading, 24)
        .padding(.top, 48)
    }
}

#Preview {
    CraneDrawer()
}
