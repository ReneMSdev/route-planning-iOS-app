//
//  SignUpView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/8/24.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @Binding var currentShowingView: String
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    func signUp() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    
    private func isValidPassword(_ password: String) -> Bool {
        // minimum 6 characters long
        // 1 uppercase character
        // 1 special character
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        ZStack {
            Color.indigo.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Create an Account!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
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
                .foregroundColor(.white)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
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
                .foregroundColor(.white)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
                )
                // End TextField 2
                .padding()
                .padding(.bottom, 20)
                
                
                // CREATE NEW ACCOUNT BUTTON
                Button {
                    signUp()
                } label: {
                    Text("Create New Account")
                        .foregroundColor(.indigo)
                        .font(.title3)
                        .bold()
                        .frame(width: 229, height:25)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white))
                        .padding(.bottom, 30)
                }
                
                // ALREADY HAVE AN ACCOUNT? BUTTON
                Button(action: {
                    withAnimation {
                        self.currentShowingView = "login"
                    }
                }) {
                    Text("Already have an account?")
                        .bold()
                        .foregroundColor(.white.opacity(0.8))
                }
                
                Spacer()
            }
        }
    }
}
#Preview {
    AuthView()
}
