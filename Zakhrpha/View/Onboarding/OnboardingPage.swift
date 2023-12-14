//
//  OnboardingPage.swift
//  Zakhrpha
//
//  Created by miqo on 11.12.23.
//

import SwiftUI

struct OnboardingPage: View {
    @EnvironmentObject var appVM: ApplicationVM
    @StateObject var onboardingVM = OnboardingVM()
        
    @State var currentPage: Int = OnboardingVM.State.first.rawValue
    let pages: [OnboardingVM.State] = OnboardingVM.State.allCases
    
    var body: some View {
        ZStack {
            TabView(selection: $currentPage) {
                ForEach(pages.indices, id: \.self) { index in
                    PageContent(state: pages[index])
                        .foregroundStyle(Color("dark_foreground"))
                        .animation(.easeIn(duration: 0.3), value: currentPage)
                        .id(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            VStack(spacing: 40) {
                Spacer()
                
                Button(action: {
                    if let nextPath = pages[currentPage].next() {
                        print("nexPath: ", nextPath.title)
                        currentPage = nextPath.rawValue
                    } else {
                        appVM.state = .mainPage
                    }
                }, label: {
                    Text("Next")
                        .frame(width: 100, height: 46)
                        .background {
                            RoundedRectangle(cornerRadius: 70)
                                .fill(Color("onboarding_button"))
                        }
                })
                .buttonStyle(ScaledButtonStyle())
                
                HStack {
                    ForEach(0..<4, id:\.self) { index in
                        Circle()
                            .fill(Color("onboarding_button"))
                            .frame(width: 5, height: 5)
                            .opacity(index == currentPage ? 1 : 0.5)
                    }
                }
                .padding(.bottom, 70)
            }
            
            Text("Skip")
                .foregroundStyle(Color(hex: "#8C8E92"))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(.trailing, 30)
                .padding(.top, 60)
                .onTapGesture { appVM.state = .mainPage }
        }
        .ignoresSafeArea()
    }
    
    func PageContent(state: OnboardingVM.State) -> some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                Color(hex: "F2F2F5")
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/2)
                Color(hex: "FFFFFF")
                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/2)
            }
            
            Image(state.image)
                .resizable().scaledToFit()
                .padding(.top, 100)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 30, content: {
                Text(state.title)
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Text(state.description)
                    .font(.system(size: 14, weight: .medium))
                    .lineLimit(nil).multilineTextAlignment(.center)
                    .frame(maxWidth: 350)
            })
            .padding(.horizontal, 30)
            .offset(y: UIScreen.screenHeight * 3/5)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingPage()
        .environmentObject(OnboardingVM())
        .environmentObject(ApplicationVM())
}
