//
//  Application.swift
//  RealTemperature
//
//  Created by miqo on 11.12.23.
//

import SwiftUI

class AppConstants {
    static let BLUE_LIENAR = LinearGradient(
        colors: [Color("linear_topLeft"), Color("linear_bottomRight")],
        startPoint: .topLeading, endPoint: .bottomTrailing
    )
}

@main
struct Application: App {
    var body: some Scene {
        WindowGroup {
            //InitialView_RealThermometer()
            InitialView()
        }
    }
}
