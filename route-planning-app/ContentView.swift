//
//  ContentView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingBottomSheet = false
    @State private var isAuthenticated: Bool = false
    @State public var showMenu: Bool = false
    @State private var selectedTab = 0
    
    var body: some View {
        
        ZStack {
            if isAuthenticated {
                switch selectedTab {
                case 0:
                    HomeView(selectedTab: $selectedTab)
                case 1:
                    Text("Favorites")
                case 2:
                    Text("Profile")
                case 3:
                    Text("Notifications")
                default:
                    HomeView(selectedTab: $selectedTab)
                }
                // Side Menu
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab, showingBottomSheet: $showingBottomSheet)
            } else {
                AuthView(isAuthenticated: $isAuthenticated)
            }
        }
    }
}

#Preview {
    ContentView()
}
