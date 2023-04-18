//
//  ColorPickerView.swift
//  Colors
//
//  Created by Cecília on 01/04/23.
//

import SwiftUI
struct ColorPickerView: View {
    
    @Binding var chosenColor: Color
        
    @State private var startLocation: CGFloat = .zero
    @State private var dragOffset: CGSize = .zero

    
    //allows the view to interact with and modify the value of the Color variable outside the view
    init(chosenColor: Binding<Color>) {
        self._chosenColor = chosenColor
    }
    
    private var colors: [Color] = {
        
        let hueValues = Array(0...359)
        //array ​​that contains int from 0 to 359, which represent the hue component of a color
    
        return hueValues.map {
            Color(UIColor(hue: CGFloat($0) / 359.0 ,
                          saturation: 1.0,
                          brightness: 1.0,
                          alpha: 1.0))}
        //For each value in the hueValues ​​array, the map function creates a UIColor object with the corresponding hue value and a saturation and brightness of 1.0 and an alpha of 1.0.
        //The UIColor object is converted using the Color() initializer
    }()
    

        
        private var currentColor: Color {
            
            Color(UIColor.init(hue: self.normalizeGesture() / 600, saturation: 1.0, brightness: 1.0, alpha: 1.0))
        }
        
        
        private func normalizeGesture() -> CGFloat {
            
            let offset = startLocation + dragOffset.width
            let maxX = max(0, offset)
            let minX = min(maxX, 600) 
            
            return minX
        }
        

    
    
    var body: some View {
        
        ZStack {
            //Gradient setting
            LinearGradient(gradient: Gradient(colors: colors),
                            startPoint: .leading,
                                       endPoint: .trailing)
            .frame(width: 600, height: 50)
                            .cornerRadius(4)
                            .shadow(radius: 4)
                
                            .gesture(
                                DragGesture().onChanged({ (value) in
                                    // 3
                                    self.dragOffset = value.translation
                                    self.startLocation = value.startLocation.x
                                    self.chosenColor = self.currentColor
                        })
                    )
            }
    }
}
