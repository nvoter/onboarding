//
//  Onboarding.swift
//  Onboarding
//
//  Created by Анастасия on 14.07.2024.
//

import SwiftUI

struct SeasonModel: Identifiable {
    let id: UUID = UUID()
    var name: String
    var description: String
    var colors: [Color]
    
    var imageName: String {
        name
    }
    
    static let testData: [SeasonModel] = [
        SeasonModel(
            name: "Autumn",
            description: "Cooler temperatures, the changing colors of leaves, which turn shades of red, orange, and yellow, and cozy sweaters",
            colors: [Color.lightAutumn, Color.darkAutumn]
        ),
        SeasonModel(
            name: "Winter",
            description: "Cold weather, snow, warm clothing, hot drinks, and holiday celebrations",
            colors: [Color.lightWinter, Color.darkWinter]
        ),
        SeasonModel(
            name: "Spring",
            description: "Flowers bloom, trees regain their leaves, and the weather becomes warmer",
            colors: [Color.lightSpring, Color.darkSpring]
        ),
        SeasonModel(
            name: "Summer",
            description: "Long, sunny days, warm weather, nature is in full bloom, and the days are vibrant and lively",
            colors: [Color.lightSummer, Color.darkSummer]
        )
    ]
}

struct Onboarding: View {
    @Binding var isOnboarded: Bool
    @State var currentStep: Int = 0
    
    let seasons: [SeasonModel]
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Spacer()
                    
                    if currentStep < seasons.count - 1 {
                        Button(action: {
                            isOnboarded = true
                        }) {
                            Text("Skip")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                        .padding(10)
                    }
                }
                
                TabView(selection: $currentStep) {
                    ForEach(seasons.indices, id: \.self) { index in
                        let season = seasons[index]
                        VStack {
                            Image(season.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            Text(season.name)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text(season.description)
                                .font(.subheadline)
                                .padding(.horizontal)
                        }
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity
                        )
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .overlay(alignment: .bottom) {
                    CustomPageIndexViewStyle(currentIndex: $currentStep, color: .white.opacity(0.5), numberOfPages: seasons.count)
                        .padding(.bottom)
                }
                
                HStack {
                    if currentStep > 0 {
                        Button(action: {
                            withAnimation {
                                currentStep -= 1
                            }
                        }) {
                            Text("Back")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                        .padding(15)
                        .background(Color(.systemGray4))
                        .cornerRadius(40)
                        .transition(.asymmetric(insertion: .push(from: .leading), removal: .push(from: .trailing)))
                    }
                    
                    if currentStep < seasons.count - 1 {
                        Button(action: {
                            withAnimation {
                                currentStep += 1
                            }
                        }) {
                            Text("Continue")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                        }
                        .padding(15)
                        .background(.white)
                        .cornerRadius(40)
                    } else {
                        Button(action: {
                            withAnimation {
                                isOnboarded = true
                            }
                        }) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                Text("Finish")
                            }
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                        }
                        .padding(15)
                        .background(.white)
                        .cornerRadius(40)
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: seasons[currentStep].colors
                ),
                startPoint: .top,
                endPoint: .bottom
            ))
    }
}

#Preview {
    @State var isOnboarded: Bool = false
    return Onboarding(
        isOnboarded: $isOnboarded,
        seasons: SeasonModel.testData
    )
}
