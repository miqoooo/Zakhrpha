//
//  File.swift
//  RealThermometer
//
//  Created by valod on 13.11.23.
//

import SwiftUI

class ApplicationVM: ObservableObject {
    enum AppState {
        case splashScreen
        case onboarding
        case mainPage
    }
    
    @Published var state: AppState =  .splashScreen
    
}
