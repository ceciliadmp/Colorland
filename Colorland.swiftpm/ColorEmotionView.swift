//
//  ColorEmotionView.swift
//  Colors
//
//  Created by Cecília on 06/04/23.
//

import Foundation
import SwiftUI

struct ColorEmotionView: View {
    
    //ARRAYS OF IMAGES AND TEXTS
    let colorDescription = [ "Tap the colors to understand some of their meanings. Remember that colors have different meanings in different cultures",
        "Red can mean passion, energy, love, danger, anger and power.",
        "Green can mean nature, health, hope and growth.",
        "Blue can convey calm, tranquility and harmony."]
    
    let bgs = ["sadBg",
               "redScreen",
               "greenScreen",
               "blueScreen"]
    
    let blue = [ "blue",
                 "loveBlue",
                 "greenBlue",
                 "calmBlue"]
    
    @State var indexText = 0
    @State var indexImages = 0
    @State var indexBlue = 0
    @State private var showRGBOnboardingView = false
    @State var transY: CGFloat = 0

    var foreverAnimation = Animation.linear.speed(0.2)
        .repeatForever(autoreverses: true)
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var contrastViewModel: ContrastViewModel
    @EnvironmentObject var colorViewModel: ColorViewModel
    
    var body: some View {
        
        ZStack{
            Image(bgs[indexImages])
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                Text("These are the primary colors in the RGB system: Red, Green and Blue")
                    .font(.system(size: 32))
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                HStack{
                    //RED BUTTON
                    Button (action: {
                        indexText = 1
                        indexImages = 1
                        indexBlue = 1
                        
                    }) {
                        Text("")
                            .foregroundColor(Color.white)
                            .frame(width: 100, height: 100)
                    }
                    .background(Color.red)
                    .cornerRadius(48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 48)
                            .stroke(Color.white, lineWidth: 5.0))
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .padding(8)
            
                    
                    //GREEN BUTTON
                    Button (action: {
                        indexText = 2
                        indexImages = 2
                        indexBlue = 2
                        
                    }) {
                        Text("")
                            .foregroundColor(Color.white)
                            .frame(width: 100, height: 100)
                    }
                    .background(Color.green)
                    .cornerRadius(48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 48)
                            .stroke(Color.white, lineWidth: 5.0))
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .padding(8)
                    
                    
                    //BLUE BUTTON
                    Button (action: {
                        indexText = 3
                        indexImages = 3
                        indexBlue = 3
                        
                    }) {
                        Text("")
                            .foregroundColor(Color.white)
                            .frame(width: 100, height: 100)
                    }
                    .background(Color.blue)
                    .cornerRadius(48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 48)
                            .stroke(Color.white, lineWidth: 5.0))
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .padding(8)}
                
                
                ZStack{
                    
                    //DIALOGUE CONTAINER
                    Rectangle()
                        .fill(Color(red: 0.093, green: 0.016, blue: 0.312))
                        .opacity(0.6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(Color(red: 0.531, green: 0.367, blue: 1), lineWidth: 2.0))
                        .cornerRadius(20)
                    
                    Text(colorDescription[indexText])
                        .foregroundColor(Color.white)
                        .font(.system(size: 24))
                        .padding(.horizontal, 16)
                        .multilineTextAlignment(.center)
                }
                .frame(height: 110)
                .padding(.vertical, 16)
                
                
                Image(blue[indexBlue])
                    .offset(x: 0, y: transY+40)
                    .onAppear() {
                        withAnimation(foreverAnimation){
                            transY = -20}}
                //When the view is displayed on the screen, the code inside the .onAppear() block is executed. In this case, an animation is triggered that affects the transY variable. The withAnimation(foreverAnimation) function sets up the animation to run continuously
                
                Spacer()
                
                HStack{
                    
                    //BACK BUTTON
                    Button {
                        dismiss()
                    } label: {
                        BackButton()}
                    
                    Spacer()
                    
                    //NEXT BUTTON
                    Button {
                        showRGBOnboardingView = true
                    } label: { NextButton() }}
                
                
                Spacer()
            
            }
            .padding(56)
        }
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
            .fullScreenCover(isPresented: $showRGBOnboardingView, content: {
                    RGBOnboardingView()
                    .environmentObject(colorViewModel)
                    .environmentObject(contrastViewModel)})
    
    }
}
    
