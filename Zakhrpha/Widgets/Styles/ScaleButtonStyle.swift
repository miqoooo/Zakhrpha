//
//  ScaleButtonStyle.swift
//  RealThermometer
//
//  Created by valod on 13.11.23.
//

import SwiftUI

public struct ScaledButtonStyle: ButtonStyle {
    public func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        configuration
            .label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .animation(.linear(duration: 0.2), value: configuration.isPressed)
    }
}
