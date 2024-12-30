//
//  CustomButton.swift
//  hike-app
//
//  Created by k21047kk on 2024/12/30.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.customGreenLight,.customGreenMedium],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            Circle()
                .stroke(LinearGradient(
                    colors: [.white,.customGrayLight,.customGrayMedium],
                    startPoint: .topLeading,
                    endPoint: .bottom
                )
                        ,lineWidth: 3)
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGrayLight,.customGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
        .frame(width: 58,height: 58)
    }
}

#Preview("CustomButtonView",traits: .sizeThatFitsLayout) {
    CustomButtonView()
        .padding()
}
