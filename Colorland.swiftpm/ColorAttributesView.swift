//
//  ColorAttributesView.swift
//  Colors
//
//  Created by Cecília on 06/04/23.
//
import SwiftUI

struct ColorAttributesView: View {
        
   
    @State private var showHueView = false
    @State var indexText2 = 0
    @State var count = 0
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var colorViewModel: ColorViewModel
     @EnvironmentObject var contrastViewModel: ContrastViewModel
    
    
    var body: some View {
        
        NavigationView {
        
        ZStack(){
            
            Image("bg3")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()
                
                ZStack(){
                    
                    //DIALOGUE CONTAINER
                    Rectangle()
                        .fill(Color(red: 0.093, green: 0.016, blue: 0.312))
                        .opacity(0.8)
                        .cornerRadius(20)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(Color(red: 0.531, green: 0.367, blue: 1), lineWidth: 4.0))
                        
                        Text("Cool! Our sky is colorful again and it looks like I got a new color. Now the next step will be to understand a little more about the attributes of colors: Hue, Saturation and Brightness.")
                            .fontWeight(.semibold)
                            .font(.system(size: 26))
                            .foregroundColor(Color.white)
                            .lineSpacing(8)
                            .padding(24)
                }
                .frame(height: 250)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 32)
                
                ZStack{
                    Circle()
                        .fill(Color(UIColor(
                            red: CGFloat((contrastViewModel.rgbRed) / 255),
                            green: CGFloat((contrastViewModel.rgbGreen) / 255),
                            blue: CGFloat((contrastViewModel.rgbBlue) / 255),
                            alpha: 1)))
                    
                        .frame(height: 400)
                        .overlay(Image("eyes"))
                    
                }
                
                
                Spacer()
                
                HStack{
                    
                    NavigationLink(destination: MenuView()
                        .environmentObject(ColorViewModel())
                        .environmentObject(contrastViewModel)) {
                            Text("MENU")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.pink)
                            .frame(width: 180, height: 70)
                            .background(Color.white).opacity(0.9)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))}
                
                    
                    Spacer()
                    
                    
                    Button {
                        showHueView = true
                    } label: { NextButton() }
                }
                
                Spacer()
                
            }
            .padding(56)
            
        }
        .fullScreenCover(isPresented: $showHueView, content: {
            HueView()
                .environmentObject(contrastViewModel)
            .environmentObject(colorViewModel)})
        
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        
    }
}


