//
//  SubscriptionPage.swift
//  Zakhrpha
//
//  Created by miqo on 14.12.23.
//

import SwiftUI

struct SubscriptionPage: View {
    enum Page: Int, CaseIterable {
        case vip_support = 0
        case money_back
        case unlimited_effects
        case ads_blocking
        
        var image: String {
            switch self {
            case .vip_support: return "vip_support"
            case .money_back: return "money_back"
            case .unlimited_effects: return "unlimited_effects"
            case .ads_blocking: return "ads_blocking"
            }
        }
        
        var title: String {
            switch self {
            case .vip_support: return "Vip support"
            case .money_back: return "money"
            case .unlimited_effects: return "unimited"
            case .ads_blocking: return "ads"
            }
        }
        
        var description: String {
            switch self {
            case .vip_support: return "Get quick supporrt from the Zakhara team"
            case .money_back: return "money"
            case .unlimited_effects: return "unimited"
            case .ads_blocking: return "ads"
            }
        }
        
        func next() -> Page? {
            switch self {
            case .vip_support: return .money_back
            case .money_back: return .unlimited_effects
            case .unlimited_effects: return .ads_blocking
            default: return nil
            }
        }
    }
    
    @Binding var isPresented: Bool
    @State var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("background")
            let pageList = Page.allCases
            
            TabView(selection: $currentPage) {
                ForEach(Array(pageList.enumerated()), id: \.offset) { index, item in
                    VStack(alignment: .center, spacing: 0) {
                        Image(item.image)
                            .resizable().scaledToFit()
                            .frame(height: 250)
                            .padding(.bottom, 20)
                    }
                    .frame(maxHeight: UIScreen.screenHeight, alignment: .bottom)
                    .padding(.bottom, 0)
                    .ignoresSafeArea()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding(.bottom, UIScreen.screenHeight/2 - 20)
            

            VStack(spacing: 15) {
                VStack(spacing: 0) {
                    Text("Be special and subscribe!")
                        .font(.system(size: 25, weight: .bold))
                    
                    Text("Get unlimited use of decoration features")
                        .font(.system(size: 18, weight: .regular))
                }
                .multilineTextAlignment(.center)
                
                VStack {}
                    .frame(height: 260)
                
                HStack(spacing: 10) {
                    ForEach(0..<4, id:\.self) { index in
                        Circle()
                            .fill(Color("button_bg"))
                            .frame(width: 10, height: 10)
                            .opacity(index == currentPage ? 1 : 0.5)
                    }
                }
                
                VStack(alignment: .center, spacing: 10, content: {
                    Text(pageList[currentPage].title)
                        .font(.system(size: 22, weight: .medium))
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                    
                    Text(pageList[currentPage].description)
                        .font(.system(size: 18, weight: .medium))
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                })
                .frame(height: 110)
                .padding(.horizontal, 30)
                
                HStack(spacing: 25) {
                    ForEach(0..<3, id: \.self) { index in
                        SubscriptionItemView(item: index)
                    }
                }
                .padding(.bottom, 10)
                
                Button(action: { }, label: {
                    Text("Subscribe")
                        .bold().foregroundStyle(Color("text"))
                        .frame(width: UIScreen.screenWidth*3/4, height: 50)
                        .background { RoundedRectangle(cornerRadius: 70).fill(Color("button_bg")) }
                })
                .buttonStyle(ScaledButtonStyle())
                
                Text("Terms and conditions")
            }
            .frame(maxHeight: UIScreen.screenHeight, alignment: .bottom)
            .padding(.bottom, 30)
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func SubscriptionItemView(item: Int) -> some View {
        let isSelected: Bool = item == 1
        
        ZStack {
            VStack(spacing: 5) {
                VStack {
                    if isSelected {
                        Text("subscribe")
                            .font(.system(size: 15, weight: .bold))
                            .frame(width: 100, height: 20)
                            .background {
                                UnevenRoundedRectangle(
                                    topLeadingRadius: 10,
                                    bottomLeadingRadius: 0,
                                    bottomTrailingRadius: 0,
                                    topTrailingRadius: 10
                                ).fill(Color("button_bg"))
                            }
                    }
                }
                .frame(width: 100, height: 20)
                
                Text("1")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.bottom, 5)
                
                Text("Forever")
                    .font(.system(size: 18, weight: .medium))
                
                Text("99.99 LE")
                    .font(.system(size: 15, weight: .light))
            }
        }
        .frame(width: 100, height: 120, alignment: .top)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(isSelected ? Color(hex: "FDFDFD") : .clear)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                        .fill(isSelected ? Color("button_bg") : Color(hex: "BDC7D7"))
                }
                .shadow(color: isSelected ? .gray.opacity(0.4) : .clear, radius: 5, y: 5)
        }
        .scaleEffect(isSelected ? 1.1 : 1)
    }
}

#Preview {
    SubscriptionPage(isPresented: .constant(true))
        .ignoresSafeArea()
}
