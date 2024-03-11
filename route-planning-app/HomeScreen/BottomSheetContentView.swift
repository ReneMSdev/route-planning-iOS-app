//
//  BottomSheetContentView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/11/24.
//

import SwiftUI

struct BottomSheetContentView: View {
    @Binding var isShowing: Bool
    @State private var address = ""

    var body: some View {
        ZStack {
            VStack {
                HStack{
                    // Handle Indicator
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 40, height: 5)
                        .padding(.top, 5)
                        .foregroundStyle(Color(.systemGray))
                }
                // Exit button
                HStack {
                    Spacer()
                    Button(action: {
                        isShowing.toggle()
                    }) {
                        Image(systemName: "x.circle")
                            .padding(6)
                            .font(.system(size: 34))
                            .foregroundColor(.indigo)
                    }
                    .padding(5)
                    .padding(.bottom, 20)
                }
            }
            
            // Scrollable content
            ScrollView {
                VStack {
                    // No route selected text
                    Text("No route selected")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    // Address fields within a NavigationView
                    NavigationView {
                        Form {
                            Section(header: Text("Addresses")) {
                                ForEach(0..<5) { _ in
                                    AddressTextField(text: $address, placeholder: "Enter Address")
                                }
                            }
                        }
                    }
                    .background(Color(.secondarySystemBackground))
                }
            }
        }
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
        .ignoresSafeArea(edges: .bottom)
    }
}

// Make sure you also define AddressTextField and PlusMinusButton as needed.

#Preview {
    HomeView()
}
