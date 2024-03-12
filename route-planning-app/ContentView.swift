//
//  ContentView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated: Bool = false
    @State public var showMenu: Bool = false
    @State private var selectedTab = 0
    
    var body: some View {
        
        ZStack {
            if isAuthenticated {
                TabView(selection: $selectedTab){
                    HomeView(selectedTab: $selectedTab)
                        .tag(0)
                    
                    Text("Plan Routes")
                        .tag(1)
                    
                    Text("Favorites")
                        .tag(2)
                    
                    Text("Profile")
                        .tag(3)
                    
                    Text("Notifications")
                        .tag(4)
                }
                // Side Menu
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
            } else {
                AuthView(isAuthenticated: $isAuthenticated)
            }
        }
    }
}

#Preview {
    ContentView()
}
