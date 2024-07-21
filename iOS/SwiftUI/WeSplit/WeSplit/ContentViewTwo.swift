//
//  ContentViewTwo.swift
//  WeSplit
//
//  Created by Christian Bringino on 6/22/24.
//

import SwiftUI

struct ContentViewTwo: View {
    var body: some View {
        VStack {
            Text("Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text Zero Text ")
                .layoutPriority(3)
            Text("First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text First Text ext Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text ext Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text ")
                .layoutPriority(1)
            Text("Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text Second Text ")
            Text("Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text ext Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text ext Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text Third Text ")
                .layoutPriority(2)
        }
        .frame(height: 600)
        .frame(maxWidth: .infinity)
        .background(.blue)
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentViewTwo()
}
