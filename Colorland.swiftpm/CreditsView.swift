//
//  CreditsView.swift
//  Colors
//
//  Created by Cecília on 11/04/23.
//

import Foundation
import SwiftUI

struct CreditsView: View {
    
    @Environment(\.dismiss) private var dismiss
   
    var body: some View {
        
            
            ZStack{
                
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                Rectangle()
                    .background(Color.black)
                    .opacity(0.3)
                
                VStack {
                    
                    Spacer()
                    
                    Text("Credits")
                        .font(.system(size: 44))
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 40)
                    
                    //ILLUSTRATIONS
                        VStack{
                            
                                
                            Text("Illustrations:")
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .padding(.top, 16)
                                    .padding(.bottom, 8)
                            
                            
                            Text("All illustrations were hand-drawn by the game's owner, Cecília Moraes. Each image was carefully created by hand in Adobe Illustrator and Figma.")
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                        }
                    
                    //SOUNDS
                    VStack{
                        
                        Text("Music:")
                                .font(.system(size: 24))
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .padding(.top, 16)
                                .padding(.bottom, 8)
                        
                        Text("Composition and musical production by the owner, Cecília Moraes. The song was made in GarageBand, Apple's native software.")
                            .font(.system(size: 20))
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 8)
                            .multilineTextAlignment(.center)
                    }
                    
                    //REFERENCES
                        VStack{
                            
                                
                            Text("References:")
                                    .font(.system(size: 24))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .padding(.top, 16)
                                    .padding(.bottom, 8)
                            
                            Text("SwiftUI: Create a Custom Gradient Color Picker like Snapchat: https://levelup.gitconnected.com/swiftui-create-a-custom-gradient-color-picker-like-snapchats-bcf508e69380\nAuthor: Brandon Baars")
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 8)
                                .multilineTextAlignment(.center)
                            
                            Text("Understanding and applying contrast: https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html")
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 8)
                                .multilineTextAlignment(.center)
                            
                            Text("Understanding and applying contrast 2: https://brasil.uxdesign.cc/explorando-a-matem%C3%A1tica-dos-crit%C3%A9rios-de-contraste-da-wcag-caa7d8093b83\nAuthor: Luciano Infanti")
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                        }
                        
                    Spacer()
                    
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            BackButton()}
                        
                        Spacer()
                    }
                    
                    Spacer()
                   
                }
                .padding(56)
            }
            .navigationBarHidden(true)
        
    }
    
}
