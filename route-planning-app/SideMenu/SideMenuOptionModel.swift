//
//  SideMenuOptionModel.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/12/24.
//

import Foundation

enum SideMenuOptionModel: Int, CaseIterable {
    case planRoute
    case favorites
    case profile
    case notifictions
    
    var title: String {
        switch self {
        case .planRoute:
            return "Plan Route"
        case .favorites:
            return "Favorites"
        case .profile:
            return "Profile"
        case .notifictions:
            return "Notifications"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .planRoute:
            return "car"
        case .favorites:
            return "heart"
        case .profile:
            return "person"
        case .notifictions:
            return "bell"
        }
    }
}

extension SideMenuOptionModel: Identifiable {
    var id: Int {return self.rawValue}
}
