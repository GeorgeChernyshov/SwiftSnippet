import SwiftUI

struct NavigationDrawer<Content : View>: View {
    private let width = UIScreen.main
        .bounds
        .width - 70
    
    @Binding var isOpen: Bool
    
    let content: Content
    
    var body: some View {
        ZStack {
            if isOpen {
                Spacer()
                    .frame(maxHeight: .infinity)
                    .background(.craneWhite.opacity(0.5))
                    .onTapGesture { isOpen = false }
            }
            
            HStack {
                content
                    .frame(
                        minWidth: self.width,
                        maxHeight: .infinity,
                        alignment: .topLeading
                    )
                    .background(.cranePurple800)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default, value: self.isOpen)
                
                Spacer()
            }
        }
    }
}
