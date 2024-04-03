//
//  NavView.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 4/3/24.
//

// ALSO THE HOME PAGE

import Foundation
import SwiftUI

let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)
let chocBrown = Color(red: 152/255, green: 94/255, blue: 73/255)

let dailyWord = DailyWord.getDailyWord()

struct NavView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text(" ")
                
                ZStack{
                    Color(offwhiteBG).ignoresSafeArea()
                    ScrollView {
                        
                        // DAILY WORD
                        VStack {
                            Text("Today's word:")
                            Text("\(dailyWord)")
                        }.padding(40)

                        // FOCUS
                        NavigationLink(destination:
                                        Text("Second screen."))
                        {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 300, height: 150)
                                    .foregroundColor(chocBrown)
                                Text("Focus")
                                    .foregroundColor(.white)
                                // MOVE TEXT
                            }.padding(20)
                        }

                        // FIDGET - might change ??
                        NavigationLink(destination:
                                        Text("Second screen."))
                        {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 300, height: 150)
                                    .foregroundColor(chocBrown)
                                Text("Fidget")
                                    .foregroundColor(.white)
                                // MOVE TEXT
                            }.padding(20)
                        }

                        // INSPIRATION
                        NavigationLink(destination:
                                        Text("Second screen."))
                        {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 300, height: 150)
                                    .foregroundColor(chocBrown)
                                Text("Inspiration")
                                    .foregroundColor(.white)
                                // MOVE TEXT
                            }.padding(20)
                        }

                    } // scrollview
                } // zstack
            }.background(chocBrown) // vstack
        } // navview
    }
}



struct DailyWord {
    static let wordList = ["Always", "Love", "Try", "Courage", "Care"]
    // ADD MORE

    static func getDailyWord() -> String {
        let calendar = Calendar.current
        let date = Date()
        let day = calendar.component(.day, from: date)
        let wordIndex = day % wordList.count
        return wordList[wordIndex]
    }
}



#Preview {
    NavView()
}
