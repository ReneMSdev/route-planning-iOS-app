//
//  SideMenuView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/10/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @Binding var selectedTab: Int
    @Binding var showingBottomSheet: Bool
    @State private var selectedOption: SideMenuOptionModel?
    
    var body: some View {
        ZStack{
            if isShowing {
                // Gray Background
                Rectangle()
                    .opacity(0.2)
                    .ignoresSafeArea()
                    .onTapGesture {isShowing.toggle()}
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        SideMenuHeaderView()
                        
                        // Buttons
                        VStack {
                            ForEach(SideMenuOptionModel.allCases) {option in
                                Button {
                                    if option == .planRoute {
                                        selectedOption = .planRoute
                                        selectedTab = 1
                                        isShowing = false
                                        //dismiss side menu
                                        showingBottomSheet.toggle()
                                    } else {
                                        onOptionTapped(option)
                                    }
                                    //onOptionTapped(option)
                                } label: {
                                    SideMenuRowView(option: option, selectedOption: $selectedOption)
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(Color(.secondarySystemBackground))
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: isShowing)
    }
    
    private func onOptionTapped(_ option: SideMenuOptionModel) {
        selectedOption = option
        selectedTab = option.rawValue
        isShowing = false
    }
}

#Preview {
    ContentView()
}
