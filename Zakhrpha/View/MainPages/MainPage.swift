//
//  HomeScreen.swift
//  RealThermometer
//
//  Created by valod on 22.11.23.
//

import SwiftUI

struct MainPage: View {
    @EnvironmentObject var appVM: ApplicationVM
    @StateObject var mainVM = MainVM()
    
    @State var tabSelection: Int = -1
    @State var isGiftPresented: Bool = true
    
    let tabItems: [MainVM.TabItem] = MainVM.TabItem.allCases
    
    var body: some View {
        ZStack {
            Color(hex: "F7F8F8")
                .ignoresSafeArea()
            
            if isGiftPresented {
                GiftPage(isPresented: $isGiftPresented)
                
            } else {
                MainPageContent()
                
                MainTabView(tabs:  [.record, .main], selection: $tabSelection) { index in
                    switch tabItems[index] {
                    case .main: EmptyView()
                    case .record: EmptyView()
                        //default: EmptyView()
                    }
                }
                .onChange(of: tabSelection, onTabSelection)
            }
        }
    }
    
    func onTabSelection(_: Int, index: Int) {
        mainVM.selectedTab = tabItems[index]
    }
    
    @ViewBuilder
    func MainPageContent() -> some View {
        ZStack {
            VStack {
                
            }
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    MainPage()
        .environmentObject(MainVM())
        .environmentObject(ApplicationVM())
}
