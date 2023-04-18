//
//  HueView.swift
//  Colors
//
//  Created by Cecília on 26/03/23.
//
import SwiftUI

struct HueView: View {
    
    @EnvironmentObject var colorViewModel: ColorViewModel
    @EnvironmentObject var contrastViewModel: ContrastViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var showSaturationView = false
    
    var body: some View {
        
        ZStack{
            
            Image("bgClear")
                .resizable()
            
            VStack{
                    
                Spacer()
                    
                    Text("Hue")
                    .font(.system(size: 44))
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
            
                    //DIALOGUE CONTAINER COMPONENT
                    DialogueContainer(image: "blueFace", text: "Hue refers to pure pigment, with no black or white added. From that main color, you can change the saturation or brightness and find new colors.")
                    
                ZStack{
                    
                    //HUE MACHINE
                    Text("Drag your finger across the color picker below to pick a color.")
                        .foregroundColor(Color.white)
                        .font(.system(size: 18))
                    
                    colorViewModel.currentColor
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0).opacity(0.3))
                        .padding(12)
                    
                    Image("machine")
                        .resizable()
                    
                } .frame(height: 330)
                
                    
                ZStack{
                    
                    //COLOR PICKER VIEW
                    Rectangle()
                        .fill(Color.black)
                        .opacity(0.2)
                        .cornerRadius(20)
                    
                    ColorPickerView(chosenColor: $colorViewModel.currentColor)
                        .padding(16)
                }
                .frame(height: 100)
                .padding(12)
                    
                
                HStack{
                    
                    //BACK BUTTON
                    Button {
                        dismiss()
                    } label: {
                        BackButton()}
                    
                    Spacer()
                    
                    //NEXT BUTTON
                    Button {
                        showSaturationView = true
                    } label: {
                        
                        Text("SAVE")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 180, height: 70)
                            .background(Color.pink)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))}

                } .padding(.top, 32)
                
                Spacer()
                
            }
            .padding(56)
            
        }
        .ignoresSafeArea()
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $showSaturationView, content: {
            SaturationView()
                .environmentObject(contrastViewModel)
                .environmentObject(colorViewModel)})
        
    }
}
