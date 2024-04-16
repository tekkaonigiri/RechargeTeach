//
//  FocusView.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 4/7/24.
//

/// NOTE: this is the page for the circleprogressbar

import Foundation
import SwiftUI

struct TimerView: View {
    
    let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)
    let chocBrown = Color(red: 152/255, green: 94/255, blue: 73/255)
    
    @State private var userMin = 0
    @State private var userSec = 0
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(chocBrown).ignoresSafeArea()
                
                VStack{
                    Text(" ")
                    
                    ZStack{
                        Color(offwhiteBG)
                        VStack{
                            CircleProgressBar(minutes: userMin, seconds: userSec)
                            
                            HStack{
                                Picker("Minutes", selection: $userMin) {
                                    ForEach(0..<60) { minute in
                                        Text("\(minute) min").tag(minute)
                                    }
                                }
                                .pickerStyle(WheelPickerStyle())
                                .frame(width: 100, height: 150)
                                
                                Picker("Seconds", selection: $userSec) {
                                    ForEach(0..<60) { second in
                                        Text("\(second) sec").tag(second)
                                    }
                                }
                                .pickerStyle(WheelPickerStyle())
                                .frame(width: 100, height: 150)
                            } // hstack
                        } // vstack
                    } // zstack
                    
                    // footer IN VStack
                    NavigationLink(destination: NavView()) {
                        VStack{
                            Text(" ")
                                .font(.footnote)
                            Image(systemName: "house.fill")
                                .font(.title)
                                .foregroundColor(offwhiteBG)
                        }
                    }
                } // vstack
            }
            
        }
        .navigationBarBackButtonHidden(true)
    } // var body some view
} // struc view
    
#Preview {
    TimerView()
}
