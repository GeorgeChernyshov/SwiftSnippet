import SwiftUI

struct CraneHome: View {
    var body: some View {
        CraneHomeContent()
    }
}

struct CraneHomeContent: View {
    let viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    CraneHome()
}

#Preview {
    CraneHomeContent()
}
