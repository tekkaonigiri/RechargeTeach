//
//  NavView.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 4/3/24.
//

// ALSO THE HOME PAGE

import Foundation
import SwiftUI

struct NavView: View {

    let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)
    let chocBrown = Color(red: 152/255, green: 94/255, blue: 73/255)

    let dailyWord = DailyWord.getDailyWord()


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
                                .font(.custom("Jost", size: 30))
                                .padding(.bottom, 5)
                            Text("\(dailyWord)")
                        }.padding(.top, 30)
                            .font(.custom("Yellowtail-Regular", size: 45))



                        // FOCUS
                        NavigationLink(destination:
                                        Text("Second screen.")) {
                                        // replace w view
                            ZStack {
                                HStack{
                                    Text("Focus")
                                        .foregroundColor(.white)
                                        .font(.custom("Jost", size: 25))
                                        .padding(.leading, 35)
                                    Image("coffee maker")
                                        .shadow(radius: 1)
                                        .padding(.leading, 20)
                                }
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 300, height: 150)
                                    .foregroundColor(chocBrown))

                                // BORDER
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .frame(width: 305, height: 155)
                                        .foregroundColor(.black))
                            }.padding(10)
                        }



                        // FIDGET - might change ??
                        NavigationLink(destination:
                                        Text("Second screen.")) {
                                        // replace w view
                            ZStack {
                                HStack{
                                    Text("Fidget")
                                        .foregroundColor(.white)
                                        .font(.custom("Jost", size: 25))
                                        .padding(.leading, 35)
                                    Image("french press")
                                        .shadow(radius: 1)
                                        .padding(.leading, 20)
                                }
                                .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 300, height: 150)
                                    .foregroundColor(chocBrown))
                                // BORDER
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .frame(width: 305, height: 155)
                                        .foregroundColor(.black))
                            }.padding(10)
                        }



                        // INSPIRATION
                        NavigationLink(destination:
                                        Text("Second screen.")) {
                                        // replace w view
                            ZStack {
                                HStack{
                                    Text("Inspiration")
                                        .foregroundColor(.white)
                                        .font(.custom("Jost", size: 25))
                                        .padding(.leading, 35)
                                    Image("espresso maker")
                                        .shadow(radius: 1)
                                        .padding(.leading, -20)
                                }
                                .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 300, height: 150)
                                    .foregroundColor(chocBrown))
                                // BORDER
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .frame(width: 305, height: 155)
                                        .foregroundColor(.black))
                            }.padding(10)
                        }

                    } // scrollview
                } // zstack
                .padding(.bottom, 10)

                Text(" ")
            }.background(chocBrown) // vstack
                                                // add thin black line to make a border for the header and footer ? maybe ? kinda aesthetic
        } // navview
        .navigationBarBackButtonHidden(true)
    }
}



struct DailyWord {
    static let wordList = ["ALWAYS", "LOVE", "TRY", "COURAGE", "CARE"]
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
