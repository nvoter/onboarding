//
//  OnboardingApp.swift
//  Onboarding
//
//  Created by Анастасия on 06.07.2024.
//

import SwiftUI

@main
struct OnboardingApp: App {
    @AppStorage("isOnboarded") var isOnboarded = false
    
    var body: some Scene {
        WindowGroup {
            if isOnboarded {
                OnboardedView()
            } else {
                Onboarding(isOnboarded: $isOnboarded, seasons: SeasonModel.testData)
            }
        }
    }
}
