//
//  SideMenuView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/10/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack{
            if isShowing {
                // Gray Background
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {isShowing.toggle()}
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        SideMenuHeaderView()
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(.white)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true))
}
