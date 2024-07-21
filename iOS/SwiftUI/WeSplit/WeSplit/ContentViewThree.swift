//
//  ContentViewThree.swift
//  WeSplit
//
//  Created by Christian Bringino on 6/22/24.
//

import SwiftUI

struct ContentViewThree: View {
    @ScaledMetric private var fontSize: CGFloat = 40
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("This is the date: ")
                    + Text(Date(), style: .date)
                        .font(.system(size: fontSize))
                    
                    Text("This is a time: ")
                    + Text(Date(), style: .time)
                        .font(.system(size: 50))
                    Text(Date().formatted(date: .complete, time: .complete))
                    
                    Text(Date().addingTimeInterval(-4300)...Date())
                }
                
                Section("Wrap Image with Text") {
                    Text("Completed! ")
                    + Text(Image(systemName: "checkmark.square.fill")).foregroundStyle(.green)
                    + Text(" You can now continue!")
                    
                    Text(Image(systemName: "trash.circle.fill"))
                        .foregroundStyle(.red)
                    + Text(" _Are you sure you want to delete?_")
                    
                    Text("_Italic_")
                        .dynamicTypeSize(.large ... .xLarge)
                        .lineLimit(1)
                        .textSelection(.enabled)
                    
                    Text("*Italic*")
                    Text("__Bold__")
                    Text("**Bold**")
                    Text("___Italic Bold___")
                    Text("***Italic Bold***")
                    Text("[URL](www.faceboook.com)")
                    Text("`Code // Monospaced`")
                }
            }
            .navigationTitle("Date")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentViewThree()
}
