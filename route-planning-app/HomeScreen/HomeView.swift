//
//  HomeView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/8/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @Binding var showMenu: Bool
    @State private var showingBottomSheet: Bool = false
    
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

        //ZStack contains markers
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
                        showMenu.toggle()
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
                        Image(systemName: "car.fill")
                            .padding(15)
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
                    .presentationDetents([
                        .fraction(0.6),
                        .fraction(0.7),
                        .fraction(0.8),
                        .fraction(0.9),
                        .fraction(0.99)])
            }
        }
    }
}

#Preview {
    ContentView()
}
