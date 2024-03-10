//
//  ContentView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated: Bool = false
    
    var body: some View {
        VStack {
            if isAuthenticated {
                HomeView()
            } else {
                AuthView(isAuthenticated: $isAuthenticated)
            }
        }
    }
}

#Preview {
    ContentView()
}
