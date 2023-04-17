//
//  ContrastOnboardingView.swift
//  Colors
//
//  Created by Cecília on 07/04/23.
//

import SwiftUI

struct ContrastOnboardingView: View {
        
    @State var indexText2 = 0
    @State var count = 0
    @State private var showContrastMachineView = false
    
    @EnvironmentObject var contrastViewModel: ContrastViewModel
    
  
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationView {
        
        ZStack(){
            
            Image("bg")
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
                    
                    Text("After that journey, allow me to introduce you to our latest invention: the Color Contrast Calculator! This amazing machine is designed to calculate the contrast between two colors, providing valuable information that can be used in many areas of Colorland and beyond.")
                        .fontWeight(.medium)
                        .font(.system(size: 28))
                        .foregroundColor(Color.white)
                        .padding(24)
                    
                } //TEXTO
                .frame(height: 250)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 32)
                
                
                Image("blue")
                    .padding(.vertical,32)
                
                Spacer()
                
                HStack{
                    
                    NavigationLink(destination: MenuView().environmentObject(contrastViewModel)) {
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
                        showContrastMachineView = true
                    } label: { NextButton()}
                }
                
                Spacer()
                
            }
            .padding(56)
            
        }
        .ignoresSafeArea()
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showContrastMachineView, content: {
            ContrastMachineView()
                .environmentObject(contrastViewModel)
            
        })
    } .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct ContrastOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        ContrastOnboardingView()
            .environmentObject(dev.vm)
            .environmentObject(dev.contrastVm)

    }
}
