//
//  SwiftUIView.swift
//  Zakhrpha
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
            Image("splash_screen")
                .resizable().scaledToFill()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    InitialView()
}
