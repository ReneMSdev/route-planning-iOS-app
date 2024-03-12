//
//  BottomSheetView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/10/24.
//

import SwiftUI

struct BottomSheetView: View {

    @Binding var showMenu: Bool
    @Binding var showingBottomSheet: Bool
    @State private var address = ""
    
    var body: some View {

        ZStack {
            VStack {
                HStack{
                    Spacer()
                    // Exit Button
                    Button (action: {
                        showingBottomSheet.toggle()
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

                // Contains addresses
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
                
                Spacer()
                
            }
            .background(Color(.secondarySystemBackground))
        }
    }
}

struct AddressTextField: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
        }
    }
}

#Preview {
    ContentView()
}
