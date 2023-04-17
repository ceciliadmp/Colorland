//
//  OptionView.swift
//  Colors
//
//  Created by Cecília on 15/04/23.
//

import Foundation
import SwiftUI

struct OptionView: View {
    
    @EnvironmentObject var contrastViewModel: ContrastViewModel
   
    var body: some View {
        
        NavigationView {
            
            ZStack{
                
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                Rectangle()
                    .fill(Color(red: 0.093, green: 0.016, blue: 0.312))
                    .opacity(0.6)
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity)
                    .overlay(
                    RoundedRectangle(cornerRadius: 20).stroke(Color(red: 0.531, green: 0.367, blue: 1), lineWidth: 2.0))
                    .frame(width: 800, height: 500)
                    
                
                VStack {
                    
                    Spacer()
                        
                        
                        Text("Do you want to try with new colors or end the adventure?")
                            .font(.system(size: 40))
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                    
                    
                    Spacer()
                        .frame(height: 50)
                    
                    HStack{
                        NavigationLink(destination: ContrastMachineView()
                            .environmentObject(contrastViewModel)) {
                                Text("TRY AGAIN")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.pink)
                                    .frame(width: 250, height: 70)
                                    .background(Color.white).opacity(0.9)
                                    .cornerRadius(16)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))}
                        
                        Spacer()
                            .frame(width: 24)
                        
                        NavigationLink(destination: FinishScreen()) {
                            Text("FINISH")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .frame(width: 250, height: 70)
                                .background(Color.pink)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))
                                .padding(4)
                                        }
                    }
                    
                    
                    Spacer()
                    
                    
                }
                .padding(56)
            }
            
            
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        
    }
    
    
    struct OptionView_Previews: PreviewProvider {
        static var previews: some View {
            OptionView()
                .environmentObject(dev.vm)
                .environmentObject(dev.contrastVm)

        }
    }
}
