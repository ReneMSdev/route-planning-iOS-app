//
//  HomeView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/8/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @Binding var selectedTab: Int
    @State private var showMenu = false
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

        //ZStack for HOME SCREEN
        ZStack{
            // CONTAINS MAP, BOTTOM SHEET & BUTTON
            ZStack{
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
            
                
                // BOTTOM SHEET BUTTON
                VStack {
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
            } // END OF ZSTACK
            
            // PRESENTS BOTTOM SHEET VIEW
            //  this works below
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.showingBottomSheet = true
                }
            }
            .sheet(isPresented: $showingBottomSheet){
                BottomSheetView(showMenu: $showMenu, showingBottomSheet: $showingBottomSheet)
                // Sets the size of the BottomSheetView
                    .presentationDetents([
                        .fraction(0.6),
                        .fraction(0.7),
                        .fraction(0.8),
                        .fraction(0.9),
                        .fraction(0.99)])
            }
            .zIndex(2)
            
            ZStack{
                // SIDE MENU BUTTON
                VStack{
                    HStack{
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
                }
                
                // SIDE MENU VIEW
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab, showingBottomSheet: $showingBottomSheet)
            }
            .zIndex(3)
        }
        
    }
}

#Preview {
    ContentView()
}
