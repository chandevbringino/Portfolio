//
//  ContentTwoView.swift
//  GuessTheFlag
//
//  Created by Christian Bringino on 6/24/24.
//

import SwiftUI

struct ContentTwoView: View {
    @State private var text = ""
    @State private var showDeleteAlert = false
    @State private var testAlert = false
    
    var body: some View {
        let updateText = {
            text = "Hello Earth!"
        }
        
        Button("Click me!", action: updateText)
        
        Text(text)
        
        VStack {
            Button(
                "Click 1",
                action: executeDelete)
            .buttonBorderShape(.roundedRectangle)
            .buttonStyle(BorderedButtonStyle())
            .alert("Delete", isPresented: $showDeleteAlert) {
                Button("Delete", role: .destructive, action: deleteText)
            } message: {
                Text("Are you sure you want to delete this message?")
            }
            
            Group {
                Button("Click 2", action: updateTextF)
                    .border(.black)
                    .buttonStyle(BorderedButtonStyle())
                
                Button("Click 3", action: updateText)
                    .buttonStyle(BorderedProminentButtonStyle())
                
                Button("Click 4", role: .destructive, action: updateTextF)
                    .buttonStyle(BorderedButtonStyle())
                
                Button("Click 5", role: .destructive, action: updateText)
                    .buttonStyle(BorderedProminentButtonStyle())
                    .tint(.mint)
                
                Button {
                    testAlert.toggle()
                } label: {
                    Text("Custom Button")
                        .padding()
                        .foregroundColor(.cyan)
                        .background(.yellow.gradient)
                        .clipShape(.buttonBorder)
                }
            }
            .alert("Test Alert", isPresented: $testAlert) {
                Button("Cancel", action: {})
            }
        }
        
        Group {
            Button("Edit", systemImage: "pencil") {
                testAlert.toggle()
            }
            .padding()
            
            Button {
                testAlert.toggle()
            } label: {
                Label("Edit button", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
                    .clipShape(.buttonBorder)
            }
        }
    }
    
    func updateTextF() {
        text = "Hello World!"
    }
    
    func executeDelete() {
        showDeleteAlert = true
    }
    
    func deleteText() {
        text = ""
    }
}

#Preview {
    ContentTwoView()
}
