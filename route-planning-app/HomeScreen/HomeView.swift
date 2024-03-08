//
//  HomeView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/8/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @State var showingBottomSheet = true
    
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
        Map(position: $camera) {
            Marker("Temple",
                   systemImage: "house.fill",
                   coordinate: location)
            //.tint(.orange)
            
            Marker("address",
                   systemImage: "house.fill",
                   coordinate: location2)
            //.tint(.orange)
            
            Marker("address2",
                   systemImage: "house.fill",
                   coordinate: location3)
            //.tint(.orange)
            
            Marker("address3",
                   systemImage: "house.fill",
                   coordinate: location4)
            //.tint(.indigo)
        }
        //        .safeAreaInset(edge: .bottom) {
        //            HStack {
        //                Spacer()
        //                Button {
        //
        //                } label: {
        //                    Text("Button")
        //                }
        //                Spacer()
        //            }
        //            .padding(.top)
        //            .background(.thinMaterial)
        //        }
        
        .sheet(isPresented: $showingBottomSheet){
            BottomSheetView()
        }
    }
}

struct BottomSheetView: View {
    var body: some View {
        ZStack {
            Color.indigo
                .edgesIgnoringSafeArea(.all)
            VStack{
                // Drag Indicator
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 60, height: 6)
                    .foregroundColor(.white)
                    .padding(.top, 15)
                
                Text("Address List")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(50)
                HStack {
                    Image(systemName: "star")
                        .foregroundStyle(.white)
                        .padding()
                    
                    Image(systemName: "bell")
                        .foregroundStyle(.white)
                        .padding()
                    
                    Image(systemName: "globe")
                        .foregroundStyle(.white)
                        .padding()
                    
                    Image(systemName: "house")
                        .foregroundStyle(.white)
                        .padding()
                }
                Spacer()
            }
        }
        
        
    }
}


//    .sheet(isPresented: $showingBottomSheet), content: {
//        ZStack(content: {
//            Color.indigo
//                .edgesIgnoringSafeArea(.all)
//            
//            Text("Address List")
//                .foregroundStyle(.white)
//        })
//    })
#Preview {
    HomeView()
}
