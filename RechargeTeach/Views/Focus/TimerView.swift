//
//  FocusView.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 4/7/24.
//

import Foundation
import SwiftUI

struct TimerView: View {
    @ObservedObject var timeManager = TimeManager()
    @State var userPickIndex = 0
    let availableMins = Array (1...59)
    
    let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)
    let chocBrown = Color(red: 152/255, green: 94/255, blue: 73/255)
    
    var body: some View {
        ZStack {
            //timer
            VStack {
                if timeManager.timerMode == .initial {
                    Text(secondsToMinutesAndSeconds(seconds:availableMins[userPickIndex]*60))
                        .font(.custom("Jost",
                                      size: 100))
                        .padding(.top, 100)
                        .padding(.bottom, -5)
                }
                else {
                    Text(secondsToMinutesAndSeconds(seconds: timeManager.secondsLeft))
                        .font(.custom("Jost",
                                      size: 100))
                        .padding(.top, 100)
                        .padding(.bottom, -5)
                }
                
                //play button
                Image (systemName: timeManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio (contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 20)
                    .onTapGesture (perform: {
                        if self.timeManager.timerMode == .initial {
                            self.timeManager.setTimerLength (minutes: self.availableMins[self.userPickIndex]*60)
                        }
                        self.timeManager.timerMode == .running ? self.timeManager.pause(): self.timeManager.start()
                    })
                
                //reset timer button
                if timeManager.timerMode == .paused {
                    Image (systemName: "gobackward")
                        .aspectRatio (contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .onTapGesture (perform: {
                            self.timeManager.reset()
                        })
                }
                
                //pick minutes
                if timeManager.timerMode == .initial {
                    Picker (selection: $userPickIndex, label: Text("")) {
                        ForEach(0..<availableMins.count, id: \.self) {
                            Text("\(self.availableMins[$0]) min")
                        }
                    }
                    .labelsHidden()
                }
                Spacer()
                
            }.navigationBarTitle("Timer") // timer vstack
            
        }
    }//main zstack
}//var body some view
    
#Preview {
    TimerView()
}
