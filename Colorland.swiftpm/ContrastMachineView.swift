//
//  ContrastMachineView.swift
//  Colors
//
//  Created by Cecília on 07/04/23.
//
import Foundation
import SwiftUI
struct ContrastMachineView: View {
    
    
    
    @State var isShowingPopup = false
    @State private var showOptionView = false
    
    @EnvironmentObject var contrastViewModel: ContrastViewModel
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        ZStack{
            
            Image("bgClear")
                .resizable()
            
            VStack{
                
                Spacer()
                
                Text("Contrast Machine")
                    .font(.system(size: 44))
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                
                DialogueContainer(image: "blueFace", text: "Play around with the colors and try to create a good contrast between them.")
                
                
                //COLORS
                HStack{
                    Rectangle()
                        .fill(Color(UIColor(red: CGFloat((contrastViewModel.firstRed) / 255),
                                            green: CGFloat((contrastViewModel.firstGreen) / 255),
                                            blue: CGFloat((contrastViewModel.firstBlue) / 255),
                                            alpha: 1)))
                        .cornerRadius(20)
                        .overlay(Image(systemName: "paintbrush.pointed.fill")
                            .resizable()
                            .frame(width: 150, height: 150))
                        .foregroundColor(Color.white)
                    
                    Spacer()
                        .frame(width: 24)
                    
                    Rectangle()
                        .fill(Color(UIColor(red: CGFloat((contrastViewModel.secondRed) / 255),
                                            green: CGFloat((contrastViewModel.secondGreen) / 255),
                                            blue: CGFloat((contrastViewModel.secondBlue) / 255),
                                            alpha: 1)))
                        .cornerRadius(20)
                        .overlay(Image(systemName: "paintbrush.pointed.fill")
                            .resizable()
                            .frame(width: 150, height: 150))
                        .foregroundColor(Color.white)
                    
                    
                }.frame(height: 350)
                
                
                //SLIDERS
                HStack(spacing: 60){
                    VStack{
                        
                        ContrastSlider1(value: $contrastViewModel.firstRed)
                        
                        ContrastSlider2(value: $contrastViewModel.firstGreen)
                        
                        ContrastSlider3(value: $contrastViewModel.firstBlue)
                    }
                    VStack{
                        
                        ContrastSlider1(value: $contrastViewModel.secondRed)
                        
                        ContrastSlider2(value: $contrastViewModel.secondGreen)
                        
                        ContrastSlider3(value: $contrastViewModel.secondBlue)
                    }}
                
                Spacer()
                    .frame(height: 32)
                
                //BUTTONS
                HStack{
                    
                    Button {
                        dismiss()
                    } label: {
                        BackButton()}
                    
                    Spacer()
                    
                    calculateButton
                }
                
                Spacer()
                
            }
            .padding(56)
            
            
        }
        .ignoresSafeArea()
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showOptionView, content: {
            OptionView()
                .environmentObject(contrastViewModel)
            
        })
        
        
        //POPUP HERE
        .sheet(isPresented: $isShowingPopup) {
            showOptionView = true
        } content: {
            
            ZStack{
                
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(16)
                    
                VStack {
                    
                    Image(systemName: "paintbrush.pointed.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.black)
                     
                    Spacer()
                        .frame(height: 100)
                    
                    Text(contrastViewModel.popUpText)
                        .font(.system(size: 44))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 16)
                    
                    Text(contrastViewModel.contrastDescription)
                        .font(.system(size: 24))
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                        
                    
                    Button {
                        isShowingPopup = false
                    } label: {
                        Text("OK")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 250, height: 70)
                            .background(Color.pink)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))
                            .padding(.vertical, 24)
                        
                    }
                } .padding(56)
            }
            

        }

    }
}
    
    struct ContrastMachineView_Previews: PreviewProvider {
        static var previews: some View {
            ContrastMachineView()
                .environmentObject(dev.vm)
                .environmentObject(dev.contrastVm)
        }
    }
