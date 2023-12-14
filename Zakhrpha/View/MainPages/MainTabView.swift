//
//  HomeTabView.swift
//  RealThermometer
//
//  Created by valod on 22.11.23.
//

import SwiftUI

struct MainTabView<Content: View>: View {
    let tabs: [MainVM.TabItem]
    @Binding var selection: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                ForEach(tabs.indices, id: \.self) { index in
                    content(index)
                        .tag(index)
                }
            }
            
            VStack {
                Spacer()
                
                ZStack {
                    HStack(spacing: 90) {
                        ForEach(tabs.indices, id: \.self) { index in
                            Button {
                                self.selection = index
                            } label: {
                                TabItemView(item: tabs[index], isSelected: (index == selection))
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background{
                        UnevenRoundedRectangle(
                            topLeadingRadius: 50,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 50
                        ).fill(
                            Color("button_bg")
                                .shadow(.drop(radius: 7, y: 0))
                            //Color("foreground")
                        )
                    }
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("unfocus"))
                        .frame(width: 60, height: 60)
                        .overlay {
                            Text("+")
                                .font(.system(size: 50, weight: .light))
                                .foregroundStyle(Color("button_bg"))
                                .offset(y: -3)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct TabItemView: View {
    let item: MainVM.TabItem
    let isSelected: Bool
    
    var body: some View {
        ZStack {
            HStack(spacing: 10) {
                Image(item.icon)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                
                Text(item.name)
                    .font(.system(size: 15))
            }
            .animation(.none, value: isSelected)
            .offset(y: isSelected ? -5 : 0)
            
            if isSelected {
                UnevenRoundedRectangle(
                    topLeadingRadius: 50,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 50
                )
                .fill(Color("focus"))
                .frame(width: 100, height: 8)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .frame(minWidth: 100)
        .animation(.default.speed(2), value: isSelected)
        .foregroundColor(isSelected ? Color("focus") : Color("unfocus"))
    }
}

#Preview {
    MainPage()
        .environmentObject(MainVM())
        .environmentObject(ApplicationVM())
}
