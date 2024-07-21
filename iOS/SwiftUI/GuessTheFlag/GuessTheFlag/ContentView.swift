//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Christian Bringino on 6/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.indigo
                .frame(width: .infinity, height: .infinity)
            VStack(alignment: .center) {
                LinearGradient(
                    colors: [.blue, .green, .red],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(height: 100)
                
                Text("Gradient 2")
                    .foregroundStyle(.red)
                    .background(.cyan.gradient)
                
                LinearGradient(
                    stops: [
                        .init(color: .cyan, location: 0.25),
                        .init(color: .red, location: 0.88)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing)
                .frame(height: 100)
                
                RadialGradient(
                    colors: [.red, .green, .indigo],
                    center: .center,
                    startRadius: 10,
                    endRadius: 50)
                .frame(height: 100)
                
                AngularGradient(
                    colors: [
                        .red, .yellow, .green, .purple, .orange],
                    center: .center)
                .frame(width: 150, height: 150)
                
                
            }
            .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
