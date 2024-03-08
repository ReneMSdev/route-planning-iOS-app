//
//  LoginView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/8/24.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @Binding var currentShowingView: String
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    private func isValidPassword(_ password: String) -> Bool {
        // minimum 6 characters long
        // 1 uppercase character
        // 1 special character
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Welcome Back!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.indigo)
                }
                .padding()
                .padding(.top, 30)
                .padding(.bottom, 80)
                
                // TextField 1
                HStack {
                    Image(systemName: "mail")
                    TextField("Email", text: $email)
                                        
                    if(email.count != 0){
                        Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(email.isValidEmail() ? .green : .red)
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                // End TextField 1
                .padding()
                // TextField 2
                HStack {
                    Image(systemName: "lock")
                    SecureField("Password", text: $password)
                                        
                    if(password.count != 0){
                        Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(isValidPassword(password) ? .green : .red)
                    }
                    
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                // End TextField 2
                .padding()
                .padding(.bottom, 20)
                
                Button(action: {
                    withAnimation {
                        self.currentShowingView = "signup"
                    }
                }) {
                    Text("Don't have an account?")
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.bottom, 50)
                }
                
                GeometryReader { geometry in
                            Button(action: {
                                // Button action here
                            }) {
                                Text("Sign In")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .bold()
                                    .frame(width: geometry.size.width * 0.6, height:25)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.indigo))
                            }
                            .frame(width: geometry.size.width)
                        }
                
                
                Spacer()
            }
        }
    }
}
#Preview {
    AuthView()
}

