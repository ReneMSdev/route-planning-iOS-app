//
//  SideMenuOptionModel.swift
//  route-planning-app
//
//  Created by Rene Salomone on 3/12/24.
//

import Foundation

enum SideMenuOptionModel: Int, CaseIterable {
    case dashboard
    case performance
    case profile
    case search
    case notifictions
    
    var title: String {
        switch self {
        case .dashboard:
            return "Map"
        case .performance:
            return "Plan Route"
        case .profile:
            return "Favorites"
        case .search:
            return "Profile"
        case .notifictions:
            return "Notifications"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .dashboard:
            return "map"
        case .performance:
            return "car"
        case .profile:
            return "heart"
        case .search:
            return "person"
        case .notifictions:
            return "bell"
        }
    }
}

extension SideMenuOptionModel: Identifiable {
    var id: Int {return self.rawValue}
}
