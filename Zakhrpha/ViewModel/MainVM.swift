//
//  MainVM.swift
//  RealThermometer
//
//  Created by valod on 22.11.23.
//

import SwiftUI

class MainVM: ObservableObject {
    enum TabItem: CaseIterable, Identifiable {
        case main
        case advice
        case measuremens
        case statistics
        case reminders
        case settings
        
        var id: Int { self.hashValue }
        
        var name: String {
            switch self {
            case .main:         return "Main"
            case .advice:       return "Advice"
            case .measuremens:  return "Measurements"
            case .statistics:   return "Statistics"
            case .reminders:    return "Reminders"
            case .settings:     return "Settings"
            }
        }
        
        var icon: String {
            return self.name.lowercased()
        }
    }
    
    @Published var selectedTab: TabItem = .advice
    @Published var tempValue: CGFloat = 0.5
}
