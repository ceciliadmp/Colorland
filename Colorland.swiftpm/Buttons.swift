//
//  Buttons.swift
//  Colors
//
//  Created by Cecília on 09/04/23.
//

import Foundation
import SwiftUI

struct BackButton: View {
    var body: some View {
        
        Text("BACK")
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(.pink)
            .frame(width: 180, height: 70)
            .background(Color.white).opacity(0.9)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))
        
        
    }
}

struct FinishButton: View {
    var body: some View {
        
        Text("FINISH")
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(.pink)
            .frame(width: 180, height: 70)
            .background(Color.white).opacity(0.9)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))
        
        
    }
}

struct NextButton: View {
    var body: some View {
        Text("NEXT")
            .font(.system(size: 20))
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .frame(width: 180, height: 70)
            .background(Color.pink)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BackButton()
            NextButton()
        }
    }
}
