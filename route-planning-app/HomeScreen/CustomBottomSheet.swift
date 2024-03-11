//
//  CustomBottomSheet.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/11/24.
//

import SwiftUI

struct CustomBottomSheet: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack{
            if isShowing {
                // Gray Background
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                }
                
                VStack() {
                    Spacer()
                    BottomSheetContentView()
                        
                }
            }
        }
    }
    
}

struct BottomSheetContentView: View {
    var body: some View {
        ZStack {
            Spacer()
            VStack {
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
    CustomBottomSheet(isShowing: .constant(true))
}
