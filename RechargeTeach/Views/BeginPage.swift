//
//  BeginPage.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 3/3/24.
//

import Foundation

import SwiftUI

struct BeginPage: View {
    @State private var isActive = false

    @State private var hotcoff_scale = 0.9
    @State private var latte_scale = 0.9
    @State private var kettle_scale = 0.95

    let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)
    let chocBrown = Color(red: 152/255, green: 94/255, blue: 73/255)

    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack{
                Color(offwhiteBG).ignoresSafeArea()
                HStack{
                    Image("hotcoffee-img")
                        .shadow(radius: 5)
                        .frame(width: 100)
                        .scaleEffect(hotcoff_scale)
                    Image("latte-img")
                        .shadow(radius: 5)
                        .frame(width: 100)
                        .scaleEffect(latte_scale)
                    
                    Image("kettle-img")
                        .shadow(radius: 5)
                        .frame(width: 100)
                        .scaleEffect(kettle_scale)
                }.onAppear {
                    let baseAnimation =
                    Animation.bouncy(duration: 1)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    withAnimation(repeated) {
                        (hotcoff_scale, latte_scale, kettle_scale) = (1, 1, 1)
                    }
                } // hstack.onappear
            } // main zstack
            /* .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            } */
        }
    }
}

#Preview {
    BeginPage()
}
