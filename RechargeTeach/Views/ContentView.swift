//
//  ContentView.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 1/19/24.
//

// START PAGE

import SwiftUI

struct ContentView: View {

    let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)
    let chocBrown = Color(red: 152/255, green: 94/255, blue: 73/255)

    var body: some View {
        NavigationView {
            ZStack{
                Color(offwhiteBG).ignoresSafeArea()
                VStack {
                    Text("RECHARGETEACH")
                        .font(.custom("Jost", size: 35))
                        .padding()
                    NavigationLink(destination: NavView()) {
                        Text("Begin")
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundColor(chocBrown)
                                .frame(width: 200, height: 60))
                        .tint(.white)
                        .font(.custom("Jost", size: 30))
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
