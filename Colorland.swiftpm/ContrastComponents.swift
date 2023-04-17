//
//  ContrastComponents.swift
//  Colors
//
//  Created by thaxz on 08/04/23.
//
import Foundation
import SwiftUI

extension ContrastMachineView {
    
    var calculateButton: some View {
        
        HStack {
            Spacer()
            Button {
                contrastViewModel.calculateRatio()
                isShowingPopup = true
            } label: {
                
                Text("CALCULATE")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(width: 180, height: 70)
                    .background(Color.pink)
                    .cornerRadius(16)
                    .overlay(
                    RoundedRectangle(cornerRadius: 20).stroke(Color(red: 1, green: 0.775, blue: 0.843), lineWidth: 3.0))}
        }
        .padding(.top, 32)
    }
        
    
}

struct ContrastSlider1: View {
    
    @Binding var value: Double
    
    var body: some View {
        Slider(value: $value, in: 0...255, step: 1) {
        } minimumValueLabel: {
            Text("R")
                .font(.system(size: 20, weight: .medium))
                .frame(width: 40, height: 30)
                .foregroundColor(.white)
        } maximumValueLabel: {
            Text("\(value)".prefix(5))
                .font(.system(size: 20, weight: .medium))
                .frame(width: 60, height: 30)
                .foregroundColor(.white)
        }
        
        .tint(Color.red)
        .cornerRadius(8)
        .padding(.vertical, 16)
    }
    
}

struct ContrastSlider2: View {
    
    @Binding var value: Double
    
    
    var body: some View {
        Slider(value: $value, in: 0...255, step: 1) {
        } minimumValueLabel: {
            Text("G")
                .font(.system(size: 20, weight: .medium))
                .frame(width: 40, height: 30)
                .foregroundColor(.white)
        } maximumValueLabel: {
            Text("\(value)".prefix(5))
                .font(.system(size: 20, weight: .medium))
                .frame(width: 60, height: 30)
                .foregroundColor(.white)
        }
        
        .tint(Color.green)
        .cornerRadius(8)
        .padding(.vertical, 16)
    }
    
}

struct ContrastSlider3: View {
    
    @Binding var value: Double
    
    var body: some View {
        Slider(value: $value, in: 0...255, step: 1) {
        } minimumValueLabel: {
            Text("B")
                .font(.system(size: 20, weight: .medium))
                .frame(width: 40, height: 30)
                .foregroundColor(.white)
        } maximumValueLabel: {
            Text("\(value)".prefix(5))
                .font(.system(size: 20, weight: .medium))
                .frame(width: 60, height: 30)
                .foregroundColor(.white)
        }
        
        .tint(Color.blue)
        .cornerRadius(8)
        .padding(.vertical, 16)
    }
    
}
