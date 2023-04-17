//
//  ColorPickerView.swift
//  Colors
//
//  Created by Cecília on 01/04/23.
//

import SwiftUI
struct ColorPickerView: View {
    
    @Binding var chosenColor: Color // 1
        
    @State private var startLocation: CGFloat = .zero // 2
    @State private var dragOffset: CGSize = .zero // 3
    // 4
    init(chosenColor: Binding<Color>) {
        self._chosenColor = chosenColor
    }
    
    private var colors: [Color] = {
        
        let hueValues = Array(0...359)
        
        return hueValues.map {
            Color(UIColor(hue: CGFloat($0) / 359.0 ,
                          saturation: 1.0,
                          brightness: 1.0,
                          alpha: 1.0))
        }
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

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(chosenColor: Binding.constant(Color.white))
    }
}
