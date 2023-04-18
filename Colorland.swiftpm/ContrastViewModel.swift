//
//  ContrastViewModel.swift
//  Colors
//
//  Created by thaxz on 08/04/23.
//
import Foundation
import SwiftUI

class ContrastViewModel: ObservableObject {
    
    //Variables used in the contrast machine
    @Published var firstRed: Double = 255
    @Published var firstGreen: Double = 255
    @Published var firstBlue: Double = 255
    @Published var secondRed: Double = 255
    @Published var secondGreen: Double = 255
    @Published var secondBlue: Double = 255
    
    //Variables used in the rgb machine
    @Published var rgbRed: Double = 255
    @Published var rgbGreen: Double = 255
    @Published var rgbBlue: Double = 255
    
    //popup texts
    @Published var popUpText: String = ""
    @Published var contrastDescription: String = ""
        
    //calculate the decimal value of red, green, and blue color components based on their corresponding values in the range of 0-255.
    var firstDecimalRed: CGFloat {
        return firstRed / 255
    }
    var firstDecimalGreen: CGFloat {
        return firstGreen / 255
    }
    var firstDecimalBlue: CGFloat {
        return firstBlue / 255
    }
    var secondDecimalRed: CGFloat {
        return secondRed / 255
    }
    var secondDecimalGreen: CGFloat {
        return secondGreen / 255
    }
    var secondDecimalBlue: CGFloat {
        return secondBlue / 255
    }
    
    //calculates the relative intensity of a color component based on its numeric value
    func individualFormula(value: Double) -> Double {
        let Y = ((value + 0.055) / 1.055)
        
        return pow(Y, 2.4)
    }
    
    func formulaGeneral() ->[Double] {
        let ilumenecenses = [firstDecimalRed, secondDecimalRed, firstDecimalGreen, secondDecimalGreen, firstDecimalBlue, secondDecimalBlue]
        //ilumenecenses array
        
        print("array of colors\(ilumenecenses)")
        
        //map function to apply the individualFormula function to each element of the ilumenecenses array
        let individualFormulas = ilumenecenses.map{ ilumenecense in
            print("FORMULA \(individualFormula(value: ilumenecense))")
            
            return individualFormula(value: ilumenecense)
        }
        
        //extraindo para uma variável individual
        let red1 = individualFormulas[0],
            green1 = individualFormulas[2],
            blue1 = individualFormulas[4]
        
        let red2 = individualFormulas[1],
            green2 = individualFormulas[3],
            blue2 = individualFormulas[5]
       
        let general1 = 0.2125 * red1 + 0.7152 * green1 + 0.0722 * blue1
        
        let general2 = 0.2125 * red2 + 0.7152 * green2 + 0.0722 * blue2
        
        
        return [general1, general2]
    }
    
    func calculateRatio() -> Double {
        
        let generals = formulaGeneral()
        let l1 = generals[0],
            l2 = generals[1]
        
        var result = 0.0
        
        if l1 > l2 {
            result = (l1 + 0.05) / (l2 + 0.05)
            print("L1 is bigger than L2")
        } else {
            result = (l2 + 0.05) / (l1 + 0.05)
            print("L2 is bigger than L1")
        }
        
        //SWITCH FOR RESULTS
        switch result {
        case 0..<3.5:
            self.popUpText = "Oh no, you can do better. Try different colors."
            self.contrastDescription = "Fail - " + String(format: "%.2f", result)
           print("RESULT 1")
            
        case 3.5..<4.5:
            self.popUpText = "It's ok, but you can improve this contrast."
            self.contrastDescription = "A - " + String(format: "%.2f", result)
            print("RESULT 2")
            
        case 4.5..<7:
            self.popUpText = "Good contrast"
            self.contrastDescription = "AA - " + String(format: "%.2f", result)
            print("RESULT 3")
            
        case 7..<23:
            self.popUpText = "Yes! These colors have great contrast. Congratulations :)"
            self.contrastDescription = "AAA - " + String(format: "%.2f", result)
            print("RESULT 4")
            
        default:
            self.popUpText = "Oh no, you can do better. Try different colors."
            print("DEFAULT")
        }
        print("result \(result)")
        return result
    }
    
}
