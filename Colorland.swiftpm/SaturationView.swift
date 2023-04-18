//
//  SaturationView.swift
//  Colors
//
//  Created by Cecília on 28/03/23.
//

import SwiftUI

struct SaturationView: View {
    
    @EnvironmentObject var colorViewModel: ColorViewModel
    @EnvironmentObject var contrastViewModel: ContrastViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var showBrightnessView = false
    
    var body: some View {
        
        ZStack{
            
            Image("bgClear")
                .resizable()
            
            VStack{
                
                Spacer()
                
                Text("Saturation")
                    .fontWeight(.regular)
                    .font(.system(size: 44))
                    .foregroundColor(Color.white)
                
                //DIALOGUE CONTAINER COMPONENT
                DialogueContainer(image: "blueFace", text: "Saturation refers to the intensity or purity of a color. A highly saturated color is vibrant and vivid, while a desaturated color is dull.")
                
                ZStack{
                    
                    colorViewModel.currentColor.saturation(colorViewModel.saturation)
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0).opacity(0.3))
                        .padding(12)
                    
                    Image("machine")
                        .resizable()
                        //.scaledToFit()
                    
                }.frame(height: 330)
                
                
                Slider(value: $colorViewModel.saturation, in: 0...1, step: 0.1) {
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
                //.background(Color.white)
                .cornerRadius(16)
                .padding(.vertical, 24)
                
                
                HStack{
                    
                    Button {
                        dismiss()
                    } label: {
                        BackButton()}
                    
                    Spacer()
                    
                    Button {
                        
                        showBrightnessView = true
                        
                    } label: {
                        
                        Text("SAVE")
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
        .fullScreenCover(isPresented: $showBrightnessView, content: {
            BrightnessView()
                .environmentObject(contrastViewModel)
            .environmentObject(colorViewModel)
            
        })
        
    }
    
}

