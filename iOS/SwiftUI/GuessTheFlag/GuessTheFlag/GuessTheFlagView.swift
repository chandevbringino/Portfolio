//
//  GuessTheFlagView.swift
//  GuessTheFlag
//
//  Created by Christian Bringino on 6/24/24.
//

import SwiftUI

struct GuessTheFlagView: View {
    @State private var showScore = false
    @State private var showFinalScore = false
    @State private var scoreTitle = ""
    @State private var navigateToFinalView = false
    
    @State var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Spain",
        "UK",
        "Ukraine",
        "US",
        "Philippines"]
    @State var correctAnswer = Int.random(in: 0...2)
    @State var selectedAnswer = 0
    @State var userScore = 0
    @State var answeredCount = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(
                    stops: [
                        .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                        .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                    ],
                    center: .top,
                    startRadius: 300,
                    endRadius: 400)
                .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    Spacer()
                    Text("Guess the Flag")
                        .font(.largeTitle.weight(.heavy))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    Text("Score: \(userScore)")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                    Spacer()
                    
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    .foregroundStyle(.white)
                    .padding()
                    
                    ForEach(0..<3) { number in
                        Button {
                            answeredCount += 1
                            flagTapped(number)
                            checkIfUserHasAnswerEightQuestions()
                        } label: {
                            FlagImage(imageName: countries[number])
                        }
                        .alert(scoreTitle, isPresented: $showScore) {
                            Button("Continue", action: askQuestion)
                        } message: {
                            Text("That's the flag of \(countries[selectedAnswer])")
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial.opacity(0.6))
                .clipShape(.rect(cornerRadius: 20))
                .onAppear {
                    reset()
                }
            }
            .navigationDestination(isPresented: $showFinalScore) {
                FinalScoreView(finalScore: "\(userScore)")
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        selectedAnswer = number
        
        if selectedAnswer == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong!"
        }
        
        if answeredCount < 10 {
            showScore.toggle()
        }
    }
    
    func checkIfUserHasAnswerEightQuestions() {
        if answeredCount == 10 {
            showFinalScore.toggle()
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        answeredCount = 0
        userScore = 0
        askQuestion()
    }
}

struct FlagImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .scaledToFit()
            .frame(width: 200, height: 100)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

#Preview {
    GuessTheFlagView()
}
