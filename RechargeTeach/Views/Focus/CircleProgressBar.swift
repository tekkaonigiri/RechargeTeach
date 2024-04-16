//
//  CircleProgressBar.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 4/12/24.
//


/// NOTE: This is a timer AND circle progress bar


import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect() // figure out wtf this does

struct CircleProgressBar: View {
    
    let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)
    let chocBrown = Color(red: 152/255, green: 94/255, blue: 73/255)
    let latteBrown = Color(red: 215/255, green: 183/255, blue: 163/255)
    let darkBrown = Color(red: 67/255, green: 45/255, blue: 39/255)
    
    @State var counter: Int = 0
    @State var isRunning = false
    @State var selectedMinutes: Int
    @State var selectedSeconds: Int
    var remainingSeconds: Int
    var countTo: Int
    
    init(minutes: Int, seconds: Int) {
        self.countTo = (minutes * 60) + seconds
        self.selectedMinutes = minutes
        self.selectedSeconds = seconds
        self.remainingSeconds = (minutes * 60) + seconds // Calculate the total seconds
    }
    
    var body: some View {
        ZStack{
            //Color(offwhiteBG).ignoresSafeArea()
            VStack{
                ZStack{
                    Circle()
                        .fill(Color.clear)
                        .frame (width: 250, height: 250)
                        .overlay(
                            Circle().stroke (chocBrown, lineWidth: 25)
                        )
                    Circle()
                        .fill(Color.clear)
                        .frame (width: 250, height: 250)
                        .overlay(
                            Circle().trim(from: 0, to: progress())
                                .stroke(
                                    style: StrokeStyle(
                                        lineWidth: 25,
                                        lineCap: .round,
                                        lineJoin:.round
                                    )
                                )
                                .foregroundColor(
                                    (completed() ? darkBrown : latteBrown)
                                )
                        )
                    
                    // changes clock time
                    //Clock(selectedMinutes: selectedMinutes, selectedSeconds: selectedSeconds - counter)
                    
                    Text("\(max((remainingSeconds - counter) / 60, 0)):\(String(format: "%02d", max((remainingSeconds - counter) % 60, 0)))")
                    // Ensure remaining time is non-negative
                        .font(.custom("Jost", size: 60))
                        .fontWeight(.black)

                } // zstack


                HStack {
                    Button(action: {
                        isRunning.toggle()
                    }) {
                        Image(systemName: isRunning ? "pause.circle.fill" : "play.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(chocBrown)
                    }
                    .padding()
                    
                    Button(action: {
                        counter = 0
                    }) {
                        Image(systemName: "gobackward")
                            .font(.largeTitle)
                            .foregroundColor(chocBrown)
                    }
                    .padding()
                }
            } // End VStack
        } // End ZStack (only for bg color)
        .onReceive(timer) { time in
            if isRunning {
                withAnimation(.easeInOut(duration: 0.2)) {
                    if (self.counter < self.countTo) {
                        self.counter += 1
                    } else {
                        // Reset the counter and stop the countdown when it reaches the end
                        self.counter = 0
                        self.isRunning = false
                    }
                }
            }
        } // onreceive
    } // var body some view


    func completed()-> Bool {
        return progress() == 1
    }
    func progress() -> CGFloat {
        let progress = CGFloat(counter) / CGFloat(countTo)
        return min(max(progress, 0), 1)
        // Ensure progress is within the range [0, 1]
    }


}

struct Clock: View {
    
    var selectedMinutes: Int
    var selectedSeconds: Int
    var remainingSeconds: Int // Calculate the remaining seconds
    
    init(selectedMinutes: Int, selectedSeconds: Int) {
        self.selectedMinutes = selectedMinutes
        self.selectedSeconds = selectedSeconds
        self.remainingSeconds = (selectedMinutes * 60) + selectedSeconds // Calculate the total seconds
    }
    
    var body: some View {
        VStack {
            Text("\(max(remainingSeconds / 60, 0)):\(String(format: "%02d", max(remainingSeconds % 60, 0)))")
            // Ensure remaining time is non-negative
                .font(.custom("Jost", size: 60))
                .fontWeight(.black)
        }
    }
} // clock



struct CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(minutes: 0, seconds: 5)
        // DO NOT SET CIRCLEPROGRESSBAR TO ZERO - otherwise is doesn't work (i think its cuz u have to call it w min-1, sec-0...idrk)

        // changing this changes how long it takes to finish the circle
        // need to find a way to match this to the user input
        // omg i fixed it im literally crying :sob:
    }
}
