//
//  BrightnessView.swift
//  Colors
//
//  Created by Cecília on 28/03/23.
//

import SwiftUI

struct BrightnessView: View {
    
    @EnvironmentObject var colorViewModel: ColorViewModel
    @EnvironmentObject var contrastViewModel: ContrastViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var showContrastOnboardingView = false
    
    var body: some View {
        
        ZStack{
            
            Image("bgClear")
                .resizable()
            
            VStack{
                
                Spacer()
                
                Text("Brightness")
                    .fontWeight(.regular)
                    .font(.system(size: 44))
                    .foregroundColor(Color.white)
                
                //DIALOGUE CONTAINER COMPONENT
                DialogueContainer(image: "blueFace", text: "Brightness, also known as value or luminosity, refers to the perceived amount of light in a color. A bright color is one that appears to reflect a lot of light and is closer to white, while a dark color is closer to black.")
                
                
                ZStack{
                    
                    colorViewModel.currentColor.brightness(colorViewModel.brightness)
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0).opacity(0.3))
                        .padding(12)
                    
                    Image("machine")
                        .resizable()
                        //.scaledToFit()
                    
                }.frame(height: 330)
                
                
                Slider(value: $colorViewModel.brightness, in: -1...1, step: 0.1) {
                } minimumValueLabel: {
                    Text("-")
                        .font(.system(size: 28, weight: .medium))
                        .foregroundColor(.white)
                } maximumValueLabel: {
                    Text("+")
                        .font(.system(size: 28, weight: .medium))
                        .foregroundColor(.white)
                }
                
                .tint(Color(red: 0.202, green: 0.867, blue: 0.468))
                .cornerRadius(16)
                .padding(.vertical, 24)
                
                
                HStack{
                    
                    Button {
                        dismiss()
                    } label: {
                        BackButton()}

                    
                    Spacer()
                    
                    Button {
                        
                        showContrastOnboardingView = true
                        
                    } label: {
                        
                        Text("FINISH")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 180, height: 70)
                            .background(Color.pink)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))}
                    
                }.padding(.top, 32)
                
                Spacer()
                
            }.padding(56)
            
        }
        .ignoresSafeArea()
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $showContrastOnboardingView, content: {
            ContrastOnboardingView()
                .environmentObject(contrastViewModel)
            .environmentObject(colorViewModel)
            
        })
        
    }
    
}

