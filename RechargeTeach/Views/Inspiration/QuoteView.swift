//
//  QuoteView.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 4/14/24.
//

/// NOTE: this is the page for the generateinsoview

import Foundation
import SwiftUI

struct QuoteView: View {
    
    let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)
    let chocBrown = Color(red: 152/255, green: 94/255, blue: 73/255)
    
    var body: some View {
        NavigationView {
            VStack{
                Text(" ")
                ZStack{
                    GenerateInspoView()
                }.background(.white)
                
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
        }
        .navigationBarBackButtonHidden(true)
    } // var body some view
} // struc view
    
#Preview {
    QuoteView()
}
