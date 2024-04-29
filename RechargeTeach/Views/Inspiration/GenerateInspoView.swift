//
//  InspirationView.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 4/14/24.
//

import Foundation
import SwiftUI

struct GenerateInspoView: View {

    let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)
    let chocBrown = Color(red: 152/255, green: 94/255, blue: 73/255)

    @State private var quoteIndex = 0
    //let quotes = ["Love \n yourself", "Don't wish \n for it. \n Work for \n it."]
    let quotes = ["\"Love yourself.\"",
                  "\"Don't wish for it. Work for it.\"",
                  "\"No one but ourselves can free our minds.\" -Bob Marley",
                  "\"Believe in yourself.\"",
                  "\"Create your own path.\"",
                  "\"Take one step at a time.\"",
                  "\"Keep pushing yourself\"",
                  "\"Believe you can and you're halfway there.\" - Theodore Roosevelt",
                  "\"It's never too late to try again.\"",
                  "\"The best is yet to come.\"",
        //10
                  "\"Choose happiness.\"",
                  "\"Stay Positive.\"",
                  "\"Be yourself. Everyone else is already taken.\"",
                  "\"Do your best everyday!\"",
                  "\"Put your best foot forward.\"",
                  "\"The sky is the limit.\"",
                  "\"Your only limit is your mind.\"",
                  "\"Mistakes are proof that you are trying.\"",
                  "\"If you can dream it, you can do it.\" -Walt Disney",
                  "\"Some walks you have to take alone.\" -Suzanne Colins",
        //20
                  "\"Life is tough, but so are you.\"",
                  "\"Life is a journey, not a race.\"",
                  "\"You are what your believe yourself to be.\" -Paulo Coelho",
                  "\"Everything is hard before it is easy\" -Goethe",
                  "\"Flowers need time to bloom. So do you.\"",
                  "\"It's always too early to quit\" -Norman Vincent Peale",
                  
    ]

    //"\"type \" type"
    //"\"type\"",

    var body: some View {
        ZStack{
            Image("coffeeBGimg")
                    .resizable()
                    .opacity(0.5)
            VStack{
                Text(quotes[quoteIndex])
                    .padding(20)
                    .font(.custom("Jost", size: 60))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)

                HStack{
                    Button(action: {
                        self.quoteIndex = Int.random(in: 0..<quotes.count)
                    }) {
                        Text("Generate quote")
                            .foregroundColor(.white)
                            .font(.custom("Jost", size: 20))
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 170, height: 40))
                            .foregroundColor(chocBrown)
                    }
                } // hstack
            } // vstack
        } // zstack
    } // var body some view
}

struct GenerateInspoView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateInspoView()
    }
}
