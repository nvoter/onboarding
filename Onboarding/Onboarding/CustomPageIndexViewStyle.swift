//
//  CustomPageIndexViewStyle.swift
//  Onboarding
//
//  Created by Анастасия on 18.07.2024.
//

import SwiftUI

struct CustomPageIndexViewStyle: View {
    @Binding var currentIndex: Int
    
    var color: Color
    let numberOfPages: Int
    private let offset: CGFloat = 4
    private let circleSize: CGFloat = 8
    private let smallScale: CGFloat = 0.6
    private let cornerRadius: CGFloat = 10
    private let primaryColor = Color.white
    private let circleSpacing: CGFloat = 8
    private let secondaryColor = Color.white.opacity(0.6)
    
    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Button {
                     currentIndex = index
                } label: {
                    Circle()
                        .fill(currentIndex == index ? primaryColor : secondaryColor)
                        .frame(width: circleSize, height: circleSize)
                        .transition(AnyTransition.opacity.combined(with: .scale))
                        .id(index)
                }
            }
        }
        .padding(offset)
        .background {
            HStack {
                color
                    .frame(width: circleSize + (circleSize + circleSpacing) * CGFloat(currentIndex) + offset * 2)
                    .cornerRadius(cornerRadius)
                Spacer(minLength: 0)
            }
        }
    }
}
