//
//  ColorViewModel.swift
//  Colors
//
//  Created by Cecília on 02/04/23.
//

import Foundation
import SwiftUI

class ColorViewModel: ObservableObject {
    
    @Published var currentColor: Color = .white.opacity(0.1)
    @Published var saturation: Double = 0.5
    @Published var brightness: Double = 0.5
    
    @Published var valueRed: Double = 255
    @Published var valueGreen: Double = 255
    @Published var valueBlue: Double = 255
    
}
