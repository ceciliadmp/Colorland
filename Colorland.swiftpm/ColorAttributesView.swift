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
    
    @State var transY: CGFloat = 0
    var foreverAnimation = Animation.linear.speed(0.3)
        .repeatForever(autoreverses: true)
  
    
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
                    
                    Rectangle()
                        .fill(Color(red: 0.093, green: 0.016, blue: 0.312))
                        .opacity(0.6)
                        .cornerRadius(20)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(Color(red: 0.531, green: 0.367, blue: 1), lineWidth: 2.0))
                    
                    Text("Cool! Our sky is colorful again. Now the next step will be to understand a little more about the attributes of colors: Hue, Saturation and Brightness.")
                        .fontWeight(.medium)
                        .font(.system(size: 28))
                        .foregroundColor(Color.white)
                        .padding(24)
                    
                } //TEXTO
                .frame(height: 250)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 32)
                
                
                Image("blue")
                    .offset(x: 0, y: transY+40)
                    .onAppear() {
                        withAnimation(foreverAnimation){
                            transY = -20
                        }}
                    .padding(.vertical,32)
                
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
                    
//                    Button {
//                        dismiss()
//                    } label: {
//                        BackButton()}
                    
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

struct ColorAttributesView_Previews: PreviewProvider {
    static var previews: some View {
        ColorAttributesView()
            .environmentObject(dev.vm)
            .environmentObject(dev.contrastVm)
    }
}

