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
    
    @State private var tabSelection: Int = -1
    let tabItems: [MainVM.TabItem] = [.advice, .measuremens, .statistics, .reminders, .settings]
    
    var body: some View {
        ZStack {
            Color(hex: "F7F8F8")
                .ignoresSafeArea()
            MainPageContent()
            
            MainTabView(tabs: tabItems, selection: $tabSelection) { index in
                switch tabItems[index] {
                case .advice: EmptyView()
                case .measuremens: EmptyView()
                case .statistics: EmptyView()
                case .reminders: EmptyView()
                case .settings: EmptyView()
                default:
                    EmptyView()
                }
            }
            .onChange(of: tabSelection, onTabSelection)
        }
    }
    
    func onTabSelection(_: Int, index: Int) {
        mainVM.selectedTab = tabItems[index]
    }
    
    @ViewBuilder
    func MainPageContent() -> some View {
        ZStack {
            VStack {
                HStack {
                    Text("Today, ") + Text(Date.now.formattedString(format: "MMM dd"))
                    Spacer()
                    
                    Button(action: {}) {
                        VStack {
                            ZStack {
                                Circle()
                                    .fill(.blue)
                                    .frame(width: 30, height: 30)
                                    .overlay { Text("M") }
                                    .foregroundStyle(.white)
                                Circle()
                                    .stroke(lineWidth: 1)
                                    .fill(.blue.opacity(0.5))
                                    .frame(width: 30+5, height: 30+5)
                                
                            }
                            Text("Me")
                                .font(.system(size: 10, weight: .light))
                        }
                    }
                }
                .foregroundStyle(.black)
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
