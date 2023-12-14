//
//  SwiftUIView.swift
//  RealTemperature
//
//  Created by miqo on 11.12.23.
//

import SwiftUI

struct InitialView: View {
    @StateObject var appVM = ApplicationVM()
    
    var body: some View {
        ZStack(alignment: .top) {
            switch appVM.state {
            case .splashScreen:
                SplashScreen()
                
            case .onboarding:
                OnboardingPage()
                
            case .mainPage:
                MainPage()
            }
        }
        .transition(.identity)
        .animation(.default, value: appVM.state)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                appVM.state = .onboarding
            })
        }
        .environmentObject(appVM)
    }
    
    @ViewBuilder
    func SplashScreen() -> some View {
        ZStack(alignment: .center) {
            AppConstants.BLUE_LIENAR
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            Image("appLogo")
                .resizable().scaledToFit()
                .frame(width: 156, height: 93)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    InitialView()
}
