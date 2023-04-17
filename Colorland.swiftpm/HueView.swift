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
            
                
                ZStack{
                    
                    Rectangle()
                        .fill(Color(red: 0.093, green: 0.016, blue: 0.312))
                        .opacity(0.6)
                        .cornerRadius(20)
                        .frame(height: 150)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(Color(red: 0.531, green: 0.367, blue: 1), lineWidth: 2.0))

                    
                    HStack (alignment: .center){
                        
                        Image("blueFace")
                            .cornerRadius(12)
                            .padding(8)
                        
                        Text("Hue refers to pure pigment, with no black or white added. From that main color, you can change the saturation or brightness and find new colors.")
                            .font(.system(size: 22))
                            .foregroundColor(Color.white)
                            .padding(.trailing, 8)
                    }
                    
                } //TEXTO
                .padding(.vertical, 12)

                ZStack{
                    
                    Text("Drag your finger across the color picker below to pick a color.")
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                    
                    colorViewModel.currentColor
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0).opacity(0.3))
                        .padding(12)
                    
                    Image("machine")
                        .resizable()
                        //.scaledToFit()
                    
                }.frame(height: 330)
                
                    
                ZStack{
                    Rectangle()
                        .fill(Color.black)
                        .opacity(0.2)
                        .cornerRadius(20)
                    
                    ColorPickerView(chosenColor: $colorViewModel.currentColor)
                        .padding(16)
                    
                    
                }.frame(height: 100)
                    .padding(12)
                    
                
                HStack{
                    
                    Button {
                        dismiss()
                    } label: {
                        BackButton()}
                    
                    Spacer()
                    
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

                }.padding(.top, 32)
                
                Spacer()
                
            }
            .padding(56)
            
        }
        .ignoresSafeArea()
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $showSaturationView, content: {
            SaturationView()
                .environmentObject(contrastViewModel)
                .environmentObject(colorViewModel)
            
        })
        
    }
    
}
    
    struct HueView_Previews: PreviewProvider {
        static var previews: some View {
            HueView()
                .environmentObject(dev.vm)
                .environmentObject(dev.contrastVm)
        }
    }

extension PreviewProvider {
    
    static var dev: DeveloperPreview{
        return DeveloperPreview.shared
    }
    
}

class DeveloperPreview {
    // Creating singleton
    static let shared = DeveloperPreview()
    private init() {}
    // To acess ViewModel in providers
    let vm = ColorViewModel()
    let contrastVm = ContrastViewModel()
    
}
