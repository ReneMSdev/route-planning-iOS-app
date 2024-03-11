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
    
    var body: some View {
        ZStack {
            // AuthView & HomeView
            VStack {
                if isAuthenticated {
                    HomeView(showMenu: $showMenu)
                } else {
                    AuthView(isAuthenticated: $isAuthenticated)
                }
            }
            
            SideMenuView(isShowing: $showMenu)
        }
    }
}

#Preview {
    ContentView()
}
