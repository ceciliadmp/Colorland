//
//  DialogueContainer.swift
//  Colors
//
//  Created by thaxz on 08/04/23.
//
import Foundation
import SwiftUI

struct DialogueContainer: View {
    
    let image: String
    let text: String
    
    var body: some View {
        
        //This type of components can be easily modified and reused in different parts of the app
        
        ZStack{
            
            Rectangle()
                .fill(Color(red: 0.093, green: 0.016, blue: 0.312))
                .opacity(0.8)
                .cornerRadius(20)
                .frame(height: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 20).stroke(Color(red: 0.531, green: 0.367, blue: 1), lineWidth: 2.0))

            
            HStack{
                
                Image(image)
                    .cornerRadius(12)
                    .padding(.trailing, 8)
                    .padding(.leading, 8)
                    
                
                Text(text)
                    .font(.system(size: 22))
                    .foregroundColor(Color.white)
                    
                Spacer()
                
            }.padding(.horizontal, 4)
            
        }
        .padding(.vertical, 12)
        
    }
}
