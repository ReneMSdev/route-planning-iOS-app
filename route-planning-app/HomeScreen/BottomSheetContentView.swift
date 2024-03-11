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
        VStack {
            // Handle Indicator
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 40, height: 5)
                .padding(.top, 5)
                .foregroundStyle(Color(.systemGray))
            
            Spacer()
            
            HStack{
                Spacer()
                //  EXIT BUTTON
                Button (action: {
                    isShowing.toggle()
                }) {
                    Image(systemName: "x.circle")
                        .padding(6)
                        .font(.system(size: 34))
                        .foregroundColor(.indigo)
                }
                .padding(5)
                
            }
            // NEED IF STATEMENT TO MAKE THIS DISAPPEAR
            // function to change text to routeName or default to ""
            Text("No route selected")
                .font(.title2)
                .foregroundStyle(Color.gray)
            
            // ScrollView for Addresses
            ScrollView {
                NavigationView {
                    Form() {
                        Section(header: Text("Addresses")) {
                            AddressTextField(text: $address, placeholder: "Enter Address")
                            AddressTextField(text: $address, placeholder: "Enter Address")
                            AddressTextField(text: $address, placeholder: "Enter Address")
                            AddressTextField(text: $address, placeholder: "Enter Address")
                            AddressTextField(text: $address, placeholder: "Enter Address")
                        }
                    }
                }
                .background(Color(.secondarySystemBackground))
            }
            
            VStack {
                // DIVIDER
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 1)
                    .foregroundStyle(Color(.indigo))
                    .padding(.horizontal, 20)
                    .padding(.top, -8)
                    .opacity(0.3)
                
                // PLUS MINUS BUTTON
                PlusMinusButton()
                    .padding(.top, 10)
                    .padding(.bottom, 30)
                // CALCULATE ROUTE BUTTON
                Button {
                    
                } label: {
                    Text("Calculate Route")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                        .frame(width: 220, height:20)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.indigo))
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
        .ignoresSafeArea(edges: .bottom)
    }
}

