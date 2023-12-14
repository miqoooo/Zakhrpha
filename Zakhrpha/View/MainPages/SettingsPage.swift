//
//  SettingsPage.swift
//  RealThermometer
//
//  Created by valod on 23.11.23.
//

import SwiftUI

struct SettingsPage: View {
    @StateObject var settingsVM = SettingsVM()
    @State var username: String = ""
    
    var body: some View {
        VStack(spacing: 40) {
            HeaderSection()
            
            UserInfoSection()
            
            UserEditSection()
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Update")
                    .font(.system(size: 16, weight: .bold))
                    .padding(.horizontal, 41)
                    .padding(.vertical, 21)
            })
            .background(Color(hex: "#8FCA56"))
            .clipShape(RoundedRectangle(cornerRadius: 100))
            .shadow(color: .black.opacity(0.2), radius: 10, y: 5)
            .padding(.bottom, 75)
        }
        .foregroundStyle(Color(hex: "#363853"))
        .padding(.horizontal, 30)
        .padding(.top, 54)
    }
    
    @ViewBuilder
    func UserEditSection() -> some View {
        VStack(alignment: .leading) {
            Text("User Name")
                .font(.system(size: 12, weight: .medium))
                .padding(.leading, 20)
            
            RoundedRectangle(cornerRadius: 400)
                .stroke(lineWidth: 1)
                .fill(Color(hex: "#D9D9D9"))
                .frame(maxWidth: .infinity, maxHeight: 56)
                .overlay {
                    TextField("John Doe", text: $username)
                        .frame(height: 56)
                        .clipShape(RoundedRectangle(cornerRadius: 500))
                        .overlay {
                            HStack {
                                Spacer()
                                Image("marker")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                            }
                        }
                        .padding(.horizontal, 30)
                }
        }
    }
    
    @ViewBuilder
    func UserInfoSection() -> some View {
        VStack(spacing: 30) {
            Image(settingsVM.userInfo.image)
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160)
                .overlay(alignment: .bottomTrailing, content: {
                    ZStack {
                        Image("profileBadge")
                            .resizable().scaledToFit()
                        Text("\(settingsVM.userInfo.lvl)")
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .frame(width: 40, height: 40)
                })
            
            Text(settingsVM.userInfo.name)
                .font(.system(size: 18, weight: .bold))
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Lvl \(settingsVM.userInfo.lvl)")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color(hex: "#363853"))
                    .padding(.horizontal, 5)
                
                ZStack {
                    GeometryReader { proxy in
                        RoundedRectangle(cornerRadius: 400)
                            .fill(Color(hex: "#363853").opacity(0.2))
                            .frame(width: proxy.size.width, height: 10)
                            .overlay(content: {
                                HStack {
                                    Spacer()
                                    
                                    Image("profileBadge")
                                        .renderingMode(.template)
                                        .resizable().scaledToFit()
                                        .frame(width: 34, height: 34)
                                        .overlay(content: {
                                            Text("\(settingsVM.userInfo.lvl+1)")
                                                .font(.system(size: 14, weight: .bold))
                                                .foregroundStyle(.white)
                                        })
                                }
                            })
                        RoundedRectangle(cornerRadius: 400)
                            .fill(Color(hex: "#8FCA56"))
                            .frame(width: settingsVM.userInfo.progress*proxy.size.width, height: 10)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 30)
        }
    }
    
    @ViewBuilder
    func HeaderSection() -> some View {
        ZStack {
            HStack {
                Text("Settings")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundStyle(Color(hex: "#363853"))
            }
            HStack {
                Spacer()
                
                ForEach(SettingsVM.Item.allCases, id:\.hashValue) { item in
                    ButtonFactory(item: item)
                }
            }
        }
    }
    
    @ViewBuilder
    func ButtonFactory(item: SettingsVM.Item) -> some View {
        Circle()
            .fill(Color(hex: "#F7F7F7"))
            .frame(width: 30, height: 30)
            .overlay(content: {
                Image(item.image)
                    .resizable().scaledToFit()
                    .frame(width: 12, height: 12)
            })
    }
}

#Preview {
    SettingsPage()
}
