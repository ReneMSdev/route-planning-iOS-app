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
    private let minHeightFactor: CGFloat = 0.3
    private let initialHeightFactor: CGFloat = 0.5
    private let maxHeightFactor: CGFloat = 0.9
    
    
    var body: some View {
        GeometryReader { geometry in
            if isShowing {
                // Click off toggle feature
                Rectangle()
                    // makes background "invisable"
                    .opacity(0.0001)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                
                VStack() {
                    Spacer()
                    BottomSheetContentView()
                }
                .frame(width: geometry.size.width, height: geometry.size.height * maxHeightFactor, alignment: .top)
                .offset(y: max(self.positionOffset + self.dragState.translation.height, 0))
                .gesture(dragGesture(geometry: geometry))
                .ignoresSafeArea()
                .onAppear {
                    self.positionOffset = geometry.size.height * (1 - self.initialHeightFactor)
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
                let verticalMovement = value.translation.height
                let screenHeight = geometry.size.height
                let newPositionOffset = self.positionOffset + verticalMovement
                
                // Snap to the closest height factor
                if newPositionOffset < screenHeight * (1 - self.maxHeightFactor) {
                    self.positionOffset = screenHeight * (1 - self.maxHeightFactor) // Expanded
                } else if newPositionOffset > screenHeight * (1 - self.minHeightFactor) {
                    self.positionOffset = screenHeight * (1 - self.minHeightFactor) // Collapsed
                } else {
                    self.positionOffset = screenHeight * (1 - self.initialHeightFactor) // Initial
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

struct BottomSheetContentView: View {
    var body: some View {
        ZStack {
            Spacer()
            VStack {
                // Handle Indicator
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 40, height: 5)
                    .padding(.top, 5)
                    .foregroundStyle(Color(.systemGray))
                
                Text("Bottom Sheet Content")
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.teal)
            .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
            .ignoresSafeArea(edges: .bottom)
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
