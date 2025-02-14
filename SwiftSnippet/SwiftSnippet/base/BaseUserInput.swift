import SwiftUI

struct CraneUserInput: View {
    
    let text: String
    let onClick: () -> ()
    let caption: String?
    
    init(
        text: String,
        onClick: @escaping () -> Void = {},
        caption: String? = nil
    ) {
        self.text = text
        self.onClick = onClick
        self.caption = caption
    }
    
    var body: some View {
        CraneBaseUserInput() {
            Text(text)
        }
    }
}

struct CraneBaseUserInput<Content: View>: View {
    
    let caption: String?
    let content: Content
    
    init(
        caption: String? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.caption = caption
        self.content = content()
    }
    var body: some View {
        content
    }
}
