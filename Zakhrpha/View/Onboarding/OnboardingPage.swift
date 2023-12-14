//
//  OnboardingPage.swift
//  RealTemperature
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
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        if let nextPath = pages[currentPage].next() {
                            print("nexPath: ", nextPath.title)
                            currentPage = nextPath.rawValue
                        } else {
                            appVM.state = .mainPage
                        }
                    }, label: {
                        ZStack {
                            Image("onboarding_button")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            Circle()
                                .stroke(lineWidth: 1)
                                .fill(Color(hex: "F7F8F8"))
                                .frame(width: 50+10, height: 50+10)
                            
                            Circle()
                                .trim(from: 0, to: pages[currentPage].trimValue)
                                .stroke(lineWidth: 3).rotation(.degrees(90))
                                .fill(AppConstants.BLUE_LIENAR)
                                .frame(width: 50+10, height: 50+10)
                        }
                    })
                    .buttonStyle(ScaledButtonStyle())
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
        }
        .ignoresSafeArea()
    }
    
    func PageContent(state: OnboardingVM.State) -> some View {
        ZStack(alignment: .top) {
            Image(state.image)
                .resizable().scaledToFit()
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 30, content: {
                Spacer()
                
                Text(state.title)
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Text(state.description)
                    .font(.system(size: 14, weight: .medium))
                    .lineLimit(nil).multilineTextAlignment(.center)
                    .frame(maxWidth: 350)
                 
                HStack {
                    let color = Color(hex: "000000")
                    
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: currentPage == 0 ? 20 : 8, height: 3)
                        .foregroundStyle(currentPage == 0 ? color : color.opacity(0.5))
                    
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: currentPage == 1 ? 20 : 8, height: 3)
                        .foregroundStyle(currentPage == 1 ? color : color.opacity(0.5))
                    
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: currentPage == 2 ? 20 : 8, height: 3)
                        .foregroundStyle(currentPage == 2 ? color : color.opacity(0.5))
                }
                .padding(.bottom, 70)
                
            })
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingPage()
        .environmentObject(OnboardingVM())
        .environmentObject(ApplicationVM())
}
