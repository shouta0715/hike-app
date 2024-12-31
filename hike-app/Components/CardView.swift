//
//  CardView.swift
//  hike-app
//
//  Created by k21047kk on 2024/12/29.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber:Int = 1
    @State private var randomNumber:Int = 1
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber   
    }
    
    
    
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
                        
                        Spacer()
                        
                        Button {
                            // ACTION: Show a Sheet
                            print("The button was tapped")
                        }label: {
                            CustomButtonView()
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
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default,value: imageNumber)
                }
                
                // MARK: - Main Footer
                Button{
                    // ACTION: Show a Sheet
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.customGreenLight,.customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(
                            color: .black.opacity(0.25),
                            radius: 0.25,
                            x: 1,
                            y: 2
                        )
                }
                .buttonStyle(GradientButton())
                

                
            }
        }
        .frame(width: 320,height: 570)
    }
}

#Preview {
    CardView()
}
