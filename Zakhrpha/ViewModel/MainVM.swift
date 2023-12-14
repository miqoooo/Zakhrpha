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
        case record
        
        var id: Int { self.hashValue }
        
        var name: String {
            switch self {
            case .main:         return "Main"
            case .record:       return "Record"
            }
        }
        
        var icon: String {
            return self.name.lowercased()
        }
    }
    
    @Published var selectedTab: TabItem = .main
    @Published var tempValue: CGFloat = 0.5
}
