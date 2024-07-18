//
//  OnboardedView.swift
//  Onboarding
//
//  Created by Анастасия on 07.07.2024.
//

import SwiftUI

struct OnboardedView: View {
    var body: some View {
        ZStack {
            Text("Welcome back!")
                .font(.largeTitle)
                .fontWeight(.heavy)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [.cyan, .teal]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

#Preview {
    OnboardedView()
}
