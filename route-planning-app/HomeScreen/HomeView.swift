//
//  HomeView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/8/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @State private var showingBottomSheet = false
    
    let location = CLLocationCoordinate2D(
        latitude: 13.686252,
        longitude: 100.566762)
    
    let location2 = CLLocationCoordinate2D(
        latitude: 13.747849,
        longitude: 100.506040)
    
    let location3 = CLLocationCoordinate2D(
        latitude: 13.751326,
        longitude: 100.542762)
    
    let location4 = CLLocationCoordinate2D(
        latitude: 13.705623,
        longitude: 100.535322)
    
    // sets the framing for the map camera (default is automatic)
    @State var camera: MapCameraPosition = .automatic
    
    
    var body: some View {
        // map contains position parameter for starting camera position
        ZStack(alignment: .bottomLeading){
            Map(position: $camera) {
                Marker("Temple",
                       systemImage: "house.fill",
                       coordinate: location)
                Marker("address",
                       systemImage: "house.fill",
                       coordinate: location2)
                Marker("address2",
                       systemImage: "house.fill",
                       coordinate: location3)
                Marker("address3",
                       systemImage: "house.fill",
                       coordinate: location4)
            }
            VStack{
                HStack{
                    // Hamburger Menu Button
                    Button (action: {
                        print("hamburger")
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .padding(12)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.indigo)
                    }
                    .padding(20)
                    Spacer()
                }
                
                Spacer()
                // Bottom Sheet Toggle Button
                HStack{
                    Spacer()
                    Button(action:{
                        showingBottomSheet.toggle()
                    }) {
                        Image(systemName: "map")
                            .padding(12)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .background(Circle().fill(Color.indigo))
                            .shadow(radius: 10)
                    }
                    Spacer()
                }
                .padding(30)
            }
            
            .sheet(isPresented: $showingBottomSheet){
                BottomSheetView(showingBottomSheet: $showingBottomSheet)
                // Sets the size of the BottomSheetView
                    .presentationDetents([.fraction(0.5), .fraction(0.99)])
                    //.presentationDragIndicator(.hidden)
            }
        }
    }
}

struct BottomSheetView: View {
    
    @Binding var showingBottomSheet: Bool

    @State private var newAddress1 = ""
    @State private var newAddress2 = ""
    @State private var newAddress3 = ""
    @State private var newAddress4 = ""
    @State private var newAddress5 = ""
    
    var body: some View {
        ZStack {
            Color(red: 0.91, green: 0.92, blue: 0.94)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack{
                    Button (action: {
                        showingBottomSheet.toggle()
                    }) {
                        Image(systemName: "xmark")
                            .padding(6)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .background(Circle().fill(Color.indigo))
                    }
                    .padding(5)
                    
                    Spacer()

//                    // Custom Drag Indicator
//                    RoundedRectangle(cornerRadius: 3)
//                        .frame(width: 60, height: 6)
//                        .foregroundColor(.indigo)
//                        .padding(.top, 10)
//                        .padding(.bottom, 20)
                    
                    Spacer()
                }
                // NEED IF STATEMENT TO MAKE THIS DISAPPEAR
                HStack{
                    Text("No route selected")
                        .padding(.bottom, 20)
                        .font(.title2)
                        .foregroundStyle(Color.gray)
                        //.padding(.leading, 20)
                    //Spacer()
                }
                
                
                
//                HStack {
//                    TextField("New Address", text: $newAddress)
//                        .textFieldStyle(RoundedBorderTextFieldStyle()) // Gives the text field a rounded border
//                        .padding(.horizontal) // Adds some spacing around the text field
//                }
                ScrollView {
                    VStack {
                        AddressTextField(text: $newAddress1, placeholder: "New Address 1")
                        AddressTextField(text: $newAddress2, placeholder: "New Address 2")
                        AddressTextField(text: $newAddress3, placeholder: "New Address 3")
                        AddressTextField(text: $newAddress4, placeholder: "New Address 4")
                        AddressTextField(text: $newAddress4, placeholder: "New Address 4")
                        AddressTextField(text: $newAddress4, placeholder: "New Address 4")
                        AddressTextField(text: $newAddress4, placeholder: "New Address 4")
                    }
               }
                .padding(.bottom, 30)
                
                // Calculate Route Button
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
            
            
        }
    }
    
}

struct AddressTextField: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 5)
        }
    }
}

#Preview {
    HomeView()
}
