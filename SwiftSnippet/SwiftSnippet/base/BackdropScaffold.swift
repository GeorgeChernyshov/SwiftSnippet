import SwiftUI

struct BackLayerHeightReader: View {
    @Binding var height: CGFloat

    var body: some View {
        GeometryReader { innerGeometry in
            Color.clear
                .onAppear {
                    height = innerGeometry.size.height
                }
                .onChange(of: innerGeometry.size) { oldValue, newValue in
                    height = newValue.height
                }
        }
    }
}

struct BackdropScaffold<AppBar: View, BackContent: View, FrontContent: View>: View {
    
    @State private var isBackLayerVisible = false
    @GestureState private var dragOffset = CGSize.zero
    @State private var backLayerHeight: CGFloat = 0
    
    private let appBar: AppBar
    private let backContent: BackContent
    private let frontContent: FrontContent

    init(
        @ViewBuilder appBar: () -> AppBar,
        @ViewBuilder backContent: () -> BackContent,
        @ViewBuilder frontContent: () -> FrontContent
    ) {
        self.appBar = appBar()
        self.backContent = backContent()
        self.frontContent = frontContent()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            appBar
            
            GeometryReader { geometry in
                ZStack(alignment: .top) {
                    backContent
                        .background(BackLayerHeightReader(height: $backLayerHeight))
                    
                    frontContent
                        .offset(y: isBackLayerVisible ? backLayerHeight : 0)
                        .offset(y: min(
                            max(dragOffset.height, 0),
                            backLayerHeight
                        ))
                        .animation(.spring(), value: isBackLayerVisible)
                        .gesture(backdropDragGesture())
                }
            }
        }
    }
    
    private func backdropDragGesture() -> some Gesture {
        return DragGesture()
            .updating(
                $dragOffset
            ) { latestDragGestureValue, dragOffset, transaction in
                dragOffset = latestDragGestureValue.translation
            }
            .onEnded { value in
                // Check if drag threshold is met
                if isBackLayerVisible {
                    if -value.translation.height > backLayerHeight / 2 {
                        isBackLayerVisible.toggle()
                    }
                } else {
                    if value.translation.height > backLayerHeight / 2 {
                        isBackLayerVisible.toggle()
                    }
                }
            }
    }
}
