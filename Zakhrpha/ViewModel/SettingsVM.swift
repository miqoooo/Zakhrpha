//
//  SettingsVM.swift
//  RealThermometer
//
//  Created by valod on 23.11.23.
//

import SwiftUI

class SettingsVM: ObservableObject {
    struct UserInfo {
        var image: String
        var lvl: Int
        var progress: Double
        var name: String
    }
    
    enum Item: CaseIterable {
        case info
        case favorite
        
        var image: String {
            switch self {
            case .info: return "infoIcon"
            case .favorite: return "starIcon"
            }
        }
    }
    
    var userInfo: UserInfo = .demo
    
}

extension SettingsVM.UserInfo {
    static let demo = SettingsVM.UserInfo(
        image: "profileImage",
        lvl: 2,
        progress: 0.7,
        name: "Explorer"
    )
}
