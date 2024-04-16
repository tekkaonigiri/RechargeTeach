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
                        NavigationLink(destination: FocusView()) {
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
                                    .frame(width: 275, height: 135)
                                    .foregroundColor(chocBrown))

                                // BORDER
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .frame(width: 280, height: 140)
                                        .foregroundColor(.black))
                            }.padding(5)
                        }



                        // TODO LIST
                        NavigationLink(destination:
                                        ToDoView()) {
                            ZStack {
                                HStack{
                                    Text("ToDo List")
                                        .foregroundColor(.white)
                                        .font(.custom("Jost", size: 25))
                                        .padding(.leading, 35)
                                    Image("french press")
                                        .shadow(radius: 1)
                                }
                                .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 275, height: 135)
                                    .foregroundColor(chocBrown))
                                // BORDER
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .frame(width: 280, height: 140)
                                        .foregroundColor(.black))
                            }.padding(5)
                        }



                        // INSPIRATION
                        NavigationLink(destination:
                                        InspirationView()) {
                            ZStack {
                                HStack{
                                    Text("Inspiration")
                                        .foregroundColor(.white)
                                        .font(.custom("Jost", size: 25))
                                        .padding(.leading, 35)
                                    Image("espresso maker")
                                        .shadow(radius: 1)
                                        .padding(.leading, -17)
                                }
                                .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 275, height: 135)
                                    .foregroundColor(chocBrown))
                                // BORDER
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .frame(width: 280, height: 140)
                                        .foregroundColor(.black))
                            }.padding(5)
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
    static let wordList = ["ADVENTURE", "ALWAYS", "BEAUTY", "BELIEVE", "BELONG", "CARE", "COMFORT", "COURAGE", "CREATE", "EMBRACE", "EXPLORE", "FAITH", "FEARLESS", "FINISH", "FOCUS", "FORGIVE", "FREE", "GIVE", "GLOW", "GRACE", "GROW", "HEART", "HOPE", "HUMBLE", "IMAGINE", "INTEGRITY", "JOURNEY", "JOY", "KINDNESS", "LAUGH", "LEARN", "LIGHT", "LISTEN", "LOVE", "NOW", "PASSION", "PATIENCE", "PEACE", "PRESENT", "PURPOSE", "REFLECT", "RELAX", "SMILE", "STRIVE", "THOUGHTFUL", "TRUTH", "TRY", "UNLIMITED", "WISDOM", "WISH", "WONDER", "WORK"]
    // ADD MORE
    static func getDailyWord() -> String {
        let calendar = Calendar.current
        let date = Date()
        let day = calendar.component(.day, from: date)
        let wordIndex = day % wordList.count
        return wordList[wordIndex]
    }
}


// just in case it gets deleted on accident lol
/*
 "ADVENTURE", "ALWAYS", "BEAUTY", "BELIEVE", "BELONG", "CARE", "COMFORT", "COURAGE", "CREATE", "EMBRACE", "EXPLORE", "FAITH", "FEARLESS", "FINISH", "FOCUS", "FORGIVE", "FREE", "GIVE", "GLOW", "GRACE", "GROW", "HEART", "HOPE", "HUMBLE", "IMAGINE", "INTEGRITY", "JOURNEY", "JOY", "KINDNESS", "LAUGH", "LEARN", "LIGHT", "LISTEN", "LOVE", "NOW", "PASSION", "PATIENCE", "PEACE", "PRESENT", "PURPOSE", "REFLECT", "RELAX", "SMILE", "STRIVE", "THOUGHTFUL", "TRUTH", "TRY", "UNLIMITED", "WISDOM", "WISH", "WONDER", "WORK"
 */


#Preview {
    NavView()
}
