//
//  SideMenuRowView.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/12/24.
//

import SwiftUI

struct SideMenuRowView: View {
    let option: SideMenuOptionModel
    @Binding var selectedOption: SideMenuOptionModel?
    
    private var isSelected: Bool {
        return selectedOption == option
    }
    
    var body: some View {
        HStack {
            Image(systemName: option.systemImageName)
                .imageScale(.medium)
            
            Text(option.title)
                .font(.title3)
                .padding(.leading, 5)
            
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(isSelected ? .indigo: .primary)
        .frame(width: 216, height: 44)
        .background(isSelected ? .indigo.opacity(0.25) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    SideMenuRowView(option: .dashboard, selectedOption: .constant(.dashboard))
}
