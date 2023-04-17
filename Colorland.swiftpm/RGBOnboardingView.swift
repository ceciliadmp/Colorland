//
//  RGBOnboardingView.swift
//  Colors
//
//  Created by Cecília on 08/04/23.
//

import SwiftUI

struct RGBOnboardingView: View {
        
    @State var indexRgb = 0
    @State var indexRgbImages = 0
    @State var count = 0
    @State private var showRGBMachineView = false
    
//    @State var transY: CGFloat = 0
//    var foreverAnimation = Animation.linear.speed(0.3)
//        .repeatForever(autoreverses: true)
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var colorViewModel: ColorViewModel
    @EnvironmentObject var contrastViewModel: ContrastViewModel
    
    let rgb = [
        "You've already started bringing color to our world! See the colored floor",
        "Our special machines capable of creating colors use the RGB system as a basis to generate new tones.",
        "For example, when we want to create a new plant for our garden, we can choose a base color like green and use the RGB machine to create new shades of green, adjusting the amounts of red, green and blue used in the mix.",
        "Each color is represented by a numeric value ranging from 0 to 255, indicating the intensity of red, green, and blue light needed to produce the desired color.",
        "With that you will be able to create new characters for Colorland. Let's try it now!"
    ]
    
    let rgbImages = [
    "blue",
    "blue",
    "plant",
    "colorSystem",
    "blue"]
    
    var body: some View {
        
        NavigationView {
        
        ZStack(){
            
            Image("bg2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()
                
                ZStack(){
                    
                    Rectangle()
                        .fill(Color(red: 0.093, green: 0.016, blue: 0.312))
                        .opacity(0.6)
                        .cornerRadius(20)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(Color(red: 0.531, green: 0.367, blue: 1), lineWidth: 2.0))
                    
                    Text(rgb[indexRgb])
                        .fontWeight(.medium)
                        .font(.system(size: 28))
                        .foregroundColor(Color.white)
                        .padding(24)
                    
                } //TEXTO
                .frame(height: 250)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 32)
                
                
                Image(rgbImages[indexRgbImages])
                    .padding(.vertical,40)
                
                Spacer()
                
                HStack{
                    
                    NavigationLink(destination: MenuView().environmentObject(colorViewModel)
                        .environmentObject(contrastViewModel)) {
                        Text("MENU")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.pink)
                            .frame(width: 180, height: 70)
                            .background(Color.white).opacity(0.9)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))}
                    
                    //                    Button {
                    //                        dismiss()
                    //                    } label: {
                    //                        BackButton()}
                    
                    Spacer()
                    
                    Button {
                        if (self.indexRgb + 1 == self.rgb.count){
                            showRGBMachineView = true
                            
                        } else {
                            self.indexRgb = (self.indexRgb + 1) % self.rgb.count
                            count += 1
                            
                            self.indexRgbImages = (self.indexRgbImages + 1) % self.rgbImages.count
                            count += 1
                        }
                    } label: {NextButton()}
                    
                }
                
                Spacer()
                
            }
            .padding(56)
            
        }
        .ignoresSafeArea()
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $showRGBMachineView, content: {
            RGBMachineView()
            
        })
      } .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
    }
}

struct RGBOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        RGBOnboardingView()
            .environmentObject(dev.vm)
            .environmentObject(dev.contrastVm)
        

    }
}
