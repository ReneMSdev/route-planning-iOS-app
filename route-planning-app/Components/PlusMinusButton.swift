//
//  PlusMinusButton.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/9/24.
//

import SwiftUI

struct PlusMinusButton: View {
    
    var body: some View {
        HStack() {
            Button (action:{
                //minus
                print("minus tapped")
            }){
                Image(systemName: "minus")
                    .foregroundStyle(Color(.gray))
                    .padding(.horizontal, 20)
                    .frame(height: 40)
            }
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button(action: {
                //plus
                print("plus tapped")
            }) {
                Image(systemName: "plus")
                    .foregroundStyle(Color(.gray))
                    .padding(.horizontal, 20)
                    .frame(height: 40)
            }
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    PlusMinusButton()
}
