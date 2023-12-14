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
        case fourth = 3
        
        var image: String {
            switch self {
            case .first:    return "onboarding_1"
            case .second:   return "onboarding_2"
            case .third:    return "onboarding_3"
            case .fourth:   return "onboarding_4"
            }
        }
        
        var title: String {
            switch self {
            case .first:     return "Title1"
            case .second:    return "Title2"
            case .third:     return "Title3"
            case .fourth:    return "Share on social networking sites"
            }
        }
        
        var description: String {
            switch self {
            case .first:     return "Text1"
            case .second:    return "Text2"
            case .third:     return "Text3"
            case .fourth:    return "Make your stories unique with your customizedstyles and our great features."
            }
        }
        
        func next() -> State? {
            switch self {
            case .first:    return State.second
            case .second:   return State.third
            case .third:    return State.fourth
            default:        return nil
            }
        }
    }
}
