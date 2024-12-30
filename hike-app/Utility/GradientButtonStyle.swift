//
//  GradientButtonStyle.swift
//  hike-app
//
//  Created by k21047kk on 2024/12/30.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal,30)
            .background(
                // Conditional Statement with Nil Coalescing
                // Condition ? A : B
                configuration.isPressed ?
                // A: When User pressed the button
                LinearGradient(
                    colors: [.customGreenMedium,.customGrayLight],
                    startPoint: .top,
                    endPoint: .bottom
                ):
                // B: When User didn't press the button
                LinearGradient(
                    colors: [.customGrayLight,.customGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(40)
    }
}
    
