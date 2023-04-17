//
//  ContrastViewModel.swift
//  Colors
//
//  Created by thaxz on 08/04/23.
//
import Foundation
import SwiftUI

class ContrastViewModel: ObservableObject {
    
    
    @Published var firstRed: Double = 255
    @Published var firstGreen: Double = 255
    @Published var firstBlue: Double = 255
    @Published var secondRed: Double = 255
    @Published var secondGreen: Double = 255
    @Published var secondBlue: Double = 255
    
    @Published var rgbRed: Double = 255
    @Published var rgbGreen: Double = 255
    @Published var rgbBlue: Double = 255
    
    @Published var popUpText: String = ""
    @Published var contrastDescription: String = ""
        
    
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
    
    func individualFormula(value: Double) -> Double {
        let Y = ((value + 0.055) / 1.055)
        return pow(Y, 2.4)
    }
    
    func formulaGeneral() ->[Double] {
        let ilumenecenses = [firstDecimalRed, secondDecimalRed, firstDecimalGreen, secondDecimalGreen, firstDecimalBlue, secondDecimalBlue]
        print("array das cores\(ilumenecenses)")
        
        let individualFormulas = ilumenecenses.map{ ilumenecense in
            print("FORMULA \(individualFormula(value: ilumenecense))")
            return individualFormula(value: ilumenecense)
        }
        
        
        let r1 = individualFormulas[0], g1 = individualFormulas[2], b1 = individualFormulas[4]
        print(" R1 \(r1)")
        let r2 = individualFormulas[1], g2 = individualFormulas[3], b2 = individualFormulas[5]
        print(" R2 \(r1)")
        let general1 = 0.2125 * r1 + 0.7152 * g1 + 0.0722 * b1
        print(" GENERAL 1 \(general1)")
        let general2 = 0.2125 * r2 + 0.7152 * g2 + 0.0722 * b2
        print(" GENERAL 2 \(general2)")
        
        return [general1, general2]
    }
    
    func calculateRatio() -> Double {
        let generals = formulaGeneral()
        let l1 = generals[0], l2 = generals[1]
        
        var result = 0.0
        
        if l1 > l2 {
            result = (l1 + 0.05) / (l2 + 0.05)
            print("L1 É MAIOR QUE L2")
        } else {
            result = (l2 + 0.05) / (l1 + 0.05)
            print("L2 É MAIOR QUE L1")
        }
        print("l1 \(l1)")
        print("l1 \(l2)")
        
        
        //SWITCH FOR RESULTS
        switch result {
        case 0..<3.5:
            self.popUpText = "Oh no, you can do better. Try different colors."
           print("RESULT 1")
        case 3.5..<4.5:
            self.popUpText = "It's ok, but you can improve this contrast."
            self.contrastDescription = "The result complies with the Web Content Accessibility Guidelines (WCAG)."
            print("RESULT 2")
        case 4.5..<7:
            self.popUpText = "Good contrast"
            self.contrastDescription = "The result complies with the Web Content Accessibility Guidelines (WCAG)."
            print("RESULT 3")
        case 7..<23:
            self.popUpText = "Yes! These colors have great contrast. Congratulations :)"
            self.contrastDescription = "The result complies with the Web Content Accessibility Guidelines (WCAG)."
            print("RESULT 4")
        default:
            self.popUpText = "Oh no, you can do better. Try different colors."
            print("DEFAULT")
        }
        print("result \(result)")
        return result
    }
    
}
