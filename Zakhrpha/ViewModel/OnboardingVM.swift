//
//  OnboardingVM.swift
//  RealThermometer
//
//  Created by valod on 13.11.23.
//

import SwiftUI

class OnboardingVM: ObservableObject {
    enum State: Int, Hashable, CaseIterable {
        case first = 0
        case second = 1
        case third = 2
        
        var image: String {
            switch self {
            case .first:    return "onboarding_1"
            case .second:   return "onboarding_2"
            case .third:    return "onboarding_3"
            }
        }
        
        var title: String {
            switch self {
            case .first:     return "Embark on Precision Temperature Monitoring."
            case .second:    return "Unleashing the Power of Real Thermometer."
            case .third:     return "Your Temperature, Your Control"
            }
        }
        
        var description: String {
            switch self {
            case .first:     return "Welcome to Real Thermometer, your go-to mobile app for accurate temperature tracking. Learn how our cutting-edge technology ensures precision and convenience in monitoring your body or the environment."
            case .second:    return "Dive into the rich features of Real Thermometer. From advanced sensors to customizable settings, understand how this app provides a comprehensive temperature tracking experience. Explore our interactive graphs, notifications, and historical data to make informed decisions."
            case .third:     return "Take control of your temperature journey with Real Thermometer. This page guides you through optimizing settings, setting thresholds, and leveraging additional tools for a personalized experience."
            }
        }
        
        var trimValue: CGFloat {
            switch self {
            case .first:     return 0
            case .second:    return 0.5
            case .third:     return 1
            }
        }
        
        func next() -> State? {
            switch self {
            case .first: return State.second
            case .second: return State.third
            default: return nil
            }
        }
    }
}
