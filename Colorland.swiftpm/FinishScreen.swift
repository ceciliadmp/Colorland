//
//  FinishScreen.swift
//  Colors
//
//  Created by Cecília on 15/04/23.
//

import Foundation
import SwiftUI

struct FinishScreen: View {
    
    @EnvironmentObject var contrastViewModel: ContrastViewModel
   
    var body: some View {
        
        NavigationView {
            
            ZStack{
                
                Image("finish")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Spacer()
                        .frame(height: 280)
                    
                    Text("Hey, traveler! This is the end of our adventure.")
                        .font(.system(size: 48))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                        .frame(height: 24)
                    
                    Text("Thanks for bringing all the colors back to Colorland. I hope you bring colors into your world and your life. A colorful life is worth living!")
                        .font(.system(size: 28))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                    
                    NavigationLink(destination: MenuView()
                        .environmentObject(contrastViewModel)) {
                        Text("MENU")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 250, height: 70)
                            .background(Color.pink)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))
                            .padding(.top, 32)
                                    }
                    
                    Spacer()
                    
                }
                .padding(56)
            }
            
            
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        
    }
    
    
    struct FinishScreen_Previews: PreviewProvider {
        static var previews: some View {
            FinishScreen()
                .environmentObject(dev.vm)
                .environmentObject(dev.contrastVm)

        }
    }
}
