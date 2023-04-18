//
//  MenuView.swift
//  Colors
//
//  Created by Cecília on 09/04/23.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject var contrastViewModel: ContrastViewModel
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                Image("menu")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Image("title")
                        .padding(.bottom, 56)
                    
                    //START BUTTON
                    NavigationLink(destination: ContentView()
                        .environmentObject(contrastViewModel)) {
                            Text("START")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .frame(width: 300, height: 70)
                                .background(Color.pink)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))
                            .padding(4)}
                    
                    //CHAPTERS BUTTON
                    NavigationLink(destination: ChaptersView()
                        .environmentObject(contrastViewModel)) {
                            Text("CHAPTERS")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.pink)
                                .frame(width: 300, height: 70)
                                .background(Color.white).opacity(0.9)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))
                            .padding(4)}
                    
                    //CREDITS BUTTON
                    NavigationLink(destination: CreditsView()) {
                        Text("CREDITS")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.pink)
                            .frame(width: 300, height: 70)
                            .background(Color.white).opacity(0.9)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))
                            .padding(4)
                    }
                    
                    .onAppear{
                        music(music: "musicWWDC")}
                    
                    Image("blue")
                        .padding(.top, 56)
                    
                    Spacer()
                    
                } .padding(56)
            }
            
            
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        
    }
}
