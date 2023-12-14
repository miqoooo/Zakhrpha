//
//  SubscriptionPage.swift
//  Zakhrpha
//
//  Created by miqo on 14.12.23.
//

import SwiftUI

struct GiftPage: View {
    @Binding var isPresented: Bool
    @State var subscriptionPresented: Bool = true
    
    var body: some View {
        ZStack {
            GiftContent()
        }
        .sheet(isPresented: $subscriptionPresented, content: {
            SubscriptionPage(isPresented: $subscriptionPresented)
        })
    }
    
    @ViewBuilder
    func GiftContent() -> some View {
        ZStack {
            Color("background")
            
            ZStack(alignment: .top) {
                HStack {
                    Image("x_circle")
                        .resizable().renderingMode(.template)
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color("button_bg"))
                        .onTapGesture { isPresented = false }
                    Spacer()
                }
                .padding([.top, .leading], 20)
                
                    Image("gift")
                        .resizable().scaledToFit()
                        .frame(width: 130, height: 130)
                        .offset(y: -130/2 - 5)
                    
                VStack(spacing: 10) {
                    Text("Watch and copy")
                        .font(.system(size: 22, weight: .bold))
                        .padding(.bottom, 20)
                    
                    Text("Watch the short trailer to get a free copy or subscribe to get all benefits")
                        .frame(maxWidth: UIScreen.screenWidth*2/3)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .light))
                        .padding(.bottom, 30)
                    
                    Button(action: { }, label: {
                        Text("Watch now")
                            .bold().foregroundStyle(Color("text"))
                            .frame(width: UIScreen.screenWidth*3/4, height: 60)
                            .background { RoundedRectangle(cornerRadius: 70).fill(Color("button_bg")) }
                    })
                    .buttonStyle(ScaledButtonStyle())
                    
                    Button(action: { subscriptionPresented = true }, label: {
                        Text("Upgrade to Pro")
                            .bold().foregroundStyle(Color("focus_text"))
                            .frame(width: UIScreen.screenWidth*3/4, height: 60)
                            .background { RoundedRectangle(cornerRadius: 70).fill(Color("focus")) }
                    })
                    .buttonStyle(ScaledButtonStyle())
                }
                .padding(.top, 90)
            }
            .frame(maxWidth: UIScreen.screenWidth-20, maxHeight: UIScreen.screenHeight/2, alignment: .top)
            .background(RoundedRectangle(cornerRadius: 30).fill(.white))
        }
    }
}

#Preview {
    ZStack {
        SubscriptionPage(isPresented: .constant(true))
    }
    .ignoresSafeArea()
}
