//
//  FocusView.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 4/7/24.
//

import Foundation
import SwiftUI

struct TimerView: View {
    
    let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)
    let chocBrown = Color(red: 152/255, green: 94/255, blue: 73/255)
    
    var body: some View {
        VStack{
            Text(" ")
            ZStack{
                CircleProgressBar(minutes: 1, seconds: 0)
                // DO NOT SET CIRCLEPROGRESSBAR TO ZERO - otherwise is doesn't work
            }

            // footer
            NavigationLink(destination: NavView()) {
                VStack{
                    Text(" ")
                        .font(.footnote)
                    Image(systemName: "house.fill")
                        .font(.title)
                        .foregroundColor(offwhiteBG)
                }
            }
        }
        .background(chocBrown)
        .navigationBarBackButtonHidden(true)
    } // var body some view
} // struc view
    
#Preview {
    TimerView()
}
