//
//  RGBMachineView.swift
//  Colors
//
//  Created by Cecília on 08/04/23.
//

import Foundation
import SwiftUI
struct RGBMachineView: View {
    

    @State private var showColorAttributesView = false
    
    @EnvironmentObject var contrastViewModel: ContrastViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack{
            Image("bgClear")
                .resizable()
            
            VStack{
                
                Spacer()
                
                Text("RGB Machine")
                    .font(.system(size: 44))
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                
                
                DialogueContainer(image: "blueFace", text: "From red, green and blue it is possible to create other colors! Test the possibilities by creating colors for Colorland.")
                
                //Rectangle where the fill color will receive the value of the variables changed by the sliders
                Rectangle()
                    .fill(Color(UIColor(
                        red: CGFloat((contrastViewModel.rgbRed) / 255),
                        green: CGFloat((contrastViewModel.rgbGreen) / 255),
                        blue: CGFloat((contrastViewModel.rgbBlue) / 255),
                        alpha: 1)))
                
                    .frame(height: 300)
                    .cornerRadius(20)
                    .overlay(Image(systemName: "paintbrush.pointed.fill")
                        .resizable()
                        .frame(width: 180, height: 180)
                        .foregroundColor(Color.white))
                
                ContrastSlider1(value: $contrastViewModel.rgbRed)
                //slider that allows the user to adjust the red component of an RGB color value, with the changes reflected in the rgbRed variable
                
                ContrastSlider2(value: $contrastViewModel.rgbGreen)
                
                ContrastSlider3(value: $contrastViewModel.rgbBlue)
                
                Spacer()
                    .frame(height: 32)
                
                HStack{
                    
                    Button {
                        dismiss()
                    } label: {
                        BackButton()}
                    
                    Spacer()
                    
                    Button {
                        showColorAttributesView = true
                    } label: {
                        NextButton()}
                    
                }
                
                Spacer()
            }
            .padding(56)
            
        }
        .ignoresSafeArea()
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $showColorAttributesView, content: {
            ColorAttributesView()
                .environmentObject(contrastViewModel)})
        
    }
}
