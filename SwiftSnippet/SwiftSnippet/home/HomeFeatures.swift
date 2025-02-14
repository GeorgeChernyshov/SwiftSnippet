import SwiftUI

struct FlySearchContent: View {
    
    let onPeopleChanged: (Int) -> ()
    let onToDestinationChanged: (String) -> ()
    
    var body: some View {
        CraneSearch {
            PeopleUserInput(
                titleSuffix: ", Economy",
                onPeopleChanged: self.onPeopleChanged
            )
        }
    }
}

struct CraneSearch<Content: View>: View {
    
    private let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 8) {
            content
                .padding(.horizontal, 24)
                .padding(.bottom, 12)
        }
    }
}
