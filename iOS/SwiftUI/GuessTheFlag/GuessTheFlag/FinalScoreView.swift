//
//  FinalScoreView.swift
//  GuessTheFlag
//
//  Created by Christian Bringino on 6/24/24.
//

import SwiftUI

struct FinalScoreView: View {
    @Environment(\.dismiss) var dismiss
    
    var finalScore: String
    
    var body: some View {
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
            
            VStack {
                Text("Your final score is")
                    .padding(.bottom, 10)
                VStack {
                    Text(finalScore + "!")
                        .foregroundStyle(.black)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding()
                }
                .background(.blue.opacity(0.6))
                .clipShape(.buttonBorder)
                
                Text("Good game!")
                    .font(.title.weight(.heavy))
                    .padding(.top, 50)
                
                Button("Play again?") {
                    dismiss()
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(Color(red: 0.1, green: 0.2, blue: 0.45))
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 30)
            .background(.regularMaterial.opacity(0.6))
            .clipShape(.rect(cornerRadius: 20))
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    FinalScoreView(finalScore: "10")
}
