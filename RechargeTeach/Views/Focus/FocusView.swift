//
//  FocusView.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 4/7/24.
//

import Foundation
import SwiftUI

struct FocusView: View {
    
    let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)
    let chocBrown = Color(red: 152/255, green: 94/255, blue: 73/255)
    
    var body: some View {
        NavigationView {
            VStack {
                Text("FOCUS")
                    .font(.custom("Jost", size: 40))
                    .padding(10)
                    .foregroundColor(.white)

                ZStack{
                    Color(offwhiteBG).ignoresSafeArea()
                    ScrollView{
                        
                        Text("\"Focus on living fully in the present.\" - Roy T. Bennett")
                            .font(.custom("Jost", size: 25))
                            .foregroundColor(.black)
                            .padding(60)
                            .multilineTextAlignment(.center)
                        
                        // TIMER
                        NavigationLink(destination:
                                        TimerView()) {
                            Text("Set a timer")
                                .font(.custom("Jost", size: 30))
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 50)
                                        .frame(width: 160, height: 50)
                                        .foregroundColor(chocBrown))
                                .background(
                                    RoundedRectangle(cornerRadius: 50)
                                        .frame(width: 163, height: 54)
                                        .foregroundColor(.black))
                        }.padding(50)

                        Link(destination: URL(string: "https://apps.apple.com/us/app/my-studystream/id6475268867")!)
                        {
                            Text("Looking for more ways to focus? \n Try \(Text("My StudyStream").foregroundColor(.blue))!")
                        }
                        .font(.custom("Jost", size: 15))
                        .padding(60)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                            

                    }
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

            }.background(chocBrown) // vstack
        } // nav view
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    FocusView()
}
