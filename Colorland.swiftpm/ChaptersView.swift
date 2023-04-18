//
//  ChaptersView.swift
//  Colors
//
//  Created by Cecília on 11/04/23.
//

import Foundation
import SwiftUI

struct ChaptersView: View {
    
    
    @EnvironmentObject var colorViewModel: ColorViewModel
    @EnvironmentObject var contrastViewModel: ContrastViewModel
   
   
    var body: some View {
        NavigationView {
            
            ZStack{
                
                Image("bg")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                        .frame(height: 100)
                    
                    Text("Chapters")
                        .font(.system(size: 44))
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                    
                    
                    //COLORS MEANING
                    NavigationLink(destination: ColorEmotionView()
                        .environmentObject(contrastViewModel)
                        .environmentObject(colorViewModel))
                    {
                        Text("     Colors meaning")
                            .font(.system(size: 20, weight: .medium))
                            .frame(width: 700, height: 90, alignment: .leading)
                            .background(Color(red: 0.093, green: 0.016, blue: 0.312).opacity(0.6))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                            .padding(4)
                        
                    }
                    
                    //RGB MACHINE
                    NavigationLink(destination: RGBOnboardingView().environmentObject(colorViewModel)
                        .environmentObject(contrastViewModel)) {
                        Text("     RGB Machine")
                            .font(.system(size: 20, weight: .medium))
                            .frame(width: 700, height: 90, alignment: .leading)
                            .background(Color(red: 0.093, green: 0.016, blue: 0.312).opacity(0.6))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                            .padding(4)
                    }
                    
                    //COLORS ATTRIBUTES
                    NavigationLink(destination: ColorAttributesView()
                        .environmentObject(contrastViewModel)
                        .environmentObject(colorViewModel)) {
                        Text("     Colors Attributes")
                                .font(.system(size: 20, weight: .medium))
                            .frame(width: 700, height: 90, alignment: .leading)
                            .background(Color(red: 0.093, green: 0.016, blue: 0.312).opacity(0.6))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                            .padding(4)
                    }
                    
                    //CONTRAST MACHINE
                    NavigationLink(destination: ContrastOnboardingView()
                        .environmentObject(contrastViewModel)
                        .environmentObject(colorViewModel)) {
                        Text("     Color Contrast Calculator")
                            .font(.system(size: 20, weight: .medium))
                            .frame(width: 700, height: 90, alignment: .leading)
                            .background(Color(red: 0.093, green: 0.016, blue: 0.312).opacity(0.6))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                            .padding(4)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: MenuView()
                        .environmentObject(contrastViewModel)) {
                        Text("MENU")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.pink)
                            .frame(width: 250, height: 70)
                            .background(Color.white).opacity(0.9)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))
                            .padding(4)
                    }
                    
                    Spacer()
                
                
            } .padding(56)
                
            } .edgesIgnoringSafeArea(.all)
            
                
        }
        .edgesIgnoringSafeArea(.all)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        
    }
}
