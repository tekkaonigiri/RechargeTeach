//
//  InspirationView.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 4/14/24.
//

import Foundation
import SwiftUI

struct InspirationView: View {

    let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)
    let chocBrown = Color(red: 152/255, green: 94/255, blue: 73/255)

    var body: some View {
        NavigationView {
            VStack {
                Text("INSPIRATION")
                    .font(.custom("Jost", size: 40))
                    .padding(10)
                    .foregroundColor(.white)

                ZStack{
                    Color(offwhiteBG).ignoresSafeArea()
                    ScrollView{
                        
                        Text("\"Believe you can and you're halfway there.\" - Theodore Roosevelt")
                            .font(.custom("Jost", size: 25))
                            .padding(60)
                            .multilineTextAlignment(.center)
                        
                        // TIMER
                        NavigationLink(destination:
                                        QuoteView()) {
                            Text("Generate a quote")
                                .font(.custom("Jost", size: 25))
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 50)
                                        .frame(width: 210, height: 50)
                                        .foregroundColor(chocBrown))
                                .background(
                                    RoundedRectangle(cornerRadius: 50)
                                        .frame(width: 213, height: 54)
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

struct InspirationView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationView()
    }
}
