//
//  CustomBottomSheet.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/11/24.
//

import SwiftUI

struct CustomBottomSheet: View {
    @Binding var isShowing: Bool
    @GestureState private var dragState = DragState.inactive
    @State private var positionOffset: CGFloat = 0
    
    // Constants for the draggable states
    private let snapRatios: [CGFloat] = [0.3,0.4,0.5,0.6,0.7,0.8,0.9]
    
    
    var body: some View {
        GeometryReader { geometry in
            if isShowing {
                // Click off toggle feature
                Rectangle()
                    // makes background "invisable"
                    .opacity(0.1)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                
                VStack() {
                    Spacer()
                    BottomSheetContentView(isShowing: $isShowing)
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                .offset(y: max(self.positionOffset + self.dragState.translation.height, 0))
                .gesture(dragGesture(geometry: geometry))
                .ignoresSafeArea()
                .onAppear {
                    self.positionOffset = geometry.size.height * (1 - 0.6)
                }
            }
        }
    }
    
    private func dragGesture(geometry: GeometryProxy) -> some Gesture {
        DragGesture()
            .updating($dragState) { drag, state, _ in
                state = .dragging(translation: drag.translation)
            }
            .onEnded { value in
                let screenHeight = geometry.size.height
                // Temporary offset to simulate movement with the drag
                let tempOffset = positionOffset + value.translation.height
                
                // Determine the final position based on the drag ending point
                let finalRatio = max(0, min(1, 1 - tempOffset / screenHeight))
                let nearestRatio = snapRatios.min(by: { abs($0 - finalRatio) < abs($1 - finalRatio) }) ?? 0.6
                
                // Animate to the nearest snap point from the current position
                withAnimation(.easeOut) {
                    positionOffset = screenHeight * (1 - nearestRatio)
                }
            }
    }
    
    enum DragState {
        case inactive
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive:
                return false
            case .dragging:
                return true
            }
        }
    }
}

// Shape for top edge
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    HomeView()
}
