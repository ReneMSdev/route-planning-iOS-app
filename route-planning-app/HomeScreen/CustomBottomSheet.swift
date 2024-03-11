//
//  CustomBottomSheet.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/11/24.
//

// NOTE : THE EXIT BUTTON AND DIVIDER ARE NOW UNDER NEATH ABOVE THE CALCULATE BUTTON

import SwiftUI

struct CustomBottomSheet: View {
    @Binding var isShowing: Bool
    @GestureState private var dragState = DragState.inactive
    @State private var positionOffset: CGFloat = 0
    
    // Constants for the draggable states
    private let snapRatios: [CGFloat] = [0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]
    
    var body: some View {
        GeometryReader { geometry in
            if isShowing {
                VStack(alignment: .trailing) {
                    // Making the background "invisible" to clicks
                    // This layer captures taps outside the bottom sheet to dismiss it
                    Rectangle()
                        .opacity(0.0001)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                isShowing.toggle()
                            }
                        }
                    
                    // Bottom sheet content
                    BottomSheetContentView(isShowing: $isShowing)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.9) // Adjust the height as needed
                        .background(Color.white)
                        .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                        .offset(y: max(self.positionOffset + self.dragState.translation.height, 0))
                        .gesture(dragGesture(geometry: geometry))
                        .onAppear {
                            self.positionOffset = geometry.size.height * (1 - 0.6) // Initial position
                        }
                    
                    //Sticky bottom content
                    VStack {
                        Divider()
                            .background(Color.indigo)
                            .opacity(0.3)
                            .padding(.horizontal, 20)
                        PlusMinusButton()
                            .padding(.vertical, 10)
                        Button(action: {
                            // Action for Calculate Route
                        }) {
                            Text("Calculate Route")
                                .foregroundColor(.white)
                                .font(.title3)
                                .bold()
                                .frame(maxWidth: 270)
                                .padding()
                                .background(Color.indigo)
                                .cornerRadius(20)
                        }
                    }
                    .background(Color(.secondarySystemBackground))
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
                .ignoresSafeArea()
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
                let tempOffset = positionOffset + value.translation.height
                let finalRatio = max(0, min(1, 1 - tempOffset / screenHeight))
                let nearestRatio = snapRatios.min(by: { abs($0 - finalRatio) < abs($1 - finalRatio) }) ?? 0.6
                
                withAnimation(.easeOut) {
                    positionOffset = screenHeight * (1 - nearestRatio) // Animate to the nearest snap point
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

// Don't forget to define the RoundedCorner struct if it's not already defined elsewhere in your code.


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
