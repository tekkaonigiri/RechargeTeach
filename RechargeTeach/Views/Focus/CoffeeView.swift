//
//  test.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 4/10/24.
//

import SwiftUI

import SwiftUI

struct CoffeeView: View {

    let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)
    let chocBrown = Color(red: 152/255, green: 94/255, blue: 73/255)
    
    @State private var isBrewing = false
    
    var body: some View {
        
        VStack {
            ZStack{
                // Coffee maker body
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 200, height: 300)
                    .foregroundColor(.gray)
                    .overlay(
                        // Animated coffee flow
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 30, height: isBrewing ? 200 : 0)
                            .foregroundColor(chocBrown)
                            .offset(y: isBrewing ? 50 : -150)
                    )
                Image(systemName: "mug.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.top, 250)
            }
            
            // Brewing text
            Text("Brewing...")
                .font(.title)
                .foregroundColor(.black)
                .opacity(isBrewing ? 1.0 : 0.0)
            
        }
        .padding()
        .onAppear {
            animateBrewing()
        }
        
    }
    
    func animateBrewing() {
        withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
            isBrewing = true
        }
    }
}

struct CoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeView()
    }
}
