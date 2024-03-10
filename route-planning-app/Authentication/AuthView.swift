//
//  AuthView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/8/24.
//

import SwiftUI

struct AuthView: View  {
    @Binding var isAuthenticated: Bool

    @State private var currentViewShowing: String = "login" // login or signup
    var body: some View {
        
        if(currentViewShowing == "login") {
            LoginView(currentShowingView: $currentViewShowing, isAuthenticated: $isAuthenticated)
                .preferredColorScheme(.light)
        } else {
            SignUpView(isAuthenticated: $isAuthenticated, currentShowingView: $currentViewShowing)
                .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        }
        
    }
}

#Preview {
    ContentView()
}
