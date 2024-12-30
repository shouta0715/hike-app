//
//  CardView.swift
//  hike-app
//
//  Created by k21047kk on 2024/12/29.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // MARK: - Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight,.customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        Button {
                            // ACTION: Show a Sheet
                            print("The button was tapped")
                        }label: {
                            Text("Button")
                        }
                    }
                    
                    Text(
                        "Fun and enjoyable outdoor activity for friends and familes"
                    )
                    .multilineTextAlignment(.leading)
                    .italic()
                    .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal,40)
                
                // MARK: - Main Content
                
                
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color("ColorIndigoMedium"),
                                    Color("ColorSalmonLight")
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        ).frame(width: 256,height: 256)
                    
                    Image("image-1")
                        .resizable()
                        .scaledToFit()
                }
                
                // MARK: - Main Footer
            }
        }
        .frame(width: 320,height: 570)
    }
}

#Preview {
    CardView()
}
