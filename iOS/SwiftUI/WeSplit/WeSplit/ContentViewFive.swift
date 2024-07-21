//
//  ContentViewFive.swift
//  WeSplit
//
//  Created by Christian Bringino on 6/23/24.
//

import SwiftUI

struct ContentViewFive: View {
    @State private var name = NameData()
    @State private var fullName: String = ""
    
    var body: some View {
        VStack {
            EditNameView(name: $name, fullName: $fullName)
            Text("Full name: \(fullName)")
                .padding(.top, 20)
        }
    }
}

struct EditNameView: View {
    @Binding var name: NameData
    @Binding var fullName: String
    
    var body: some View {
        TextField("First name", text: $name.firstName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        TextField("Last name", text: $name.lastName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
            .padding(.bottom, 30)
        
        Button("Show full name") {
            fullName = name.firstName + " " + name.lastName
        }
    }
}

struct NameData {
    var firstName: String = ""
    var lastName: String = ""
}

struct Person: Identifiable {
    var id = UUID()
    var firstName = ""
    var lastName = ""
}

struct BindingWithList: View {
    @State private var modifierActive = false
    @State private var persons = [
        Person(firstName: "Risha Lei", lastName: "Reyes"),
        Person(firstName: "Christian", lastName: "Bringino"),
        Person(firstName: "Oreo", lastName: "Bringino"),
        Person(firstName: "Cream-O", lastName: "Bringino"),
        Person(firstName: "Milky", lastName: "Bringino")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                List($persons) { $person in
                    NavigationLink(
                        destination: EditPersonNameView(
                            person: $person
                        )
                    ) {
                        Text("\(person.firstName) \(person.lastName)")
                    }
                    
                    Form {
                        Section("Text View Modifiers") {
                            Text("Hello I'm text view")
                                .fontWeight(.black)
                                .font(.title)
                                .tracking(8)
                            
                            Text("Decreased Tracking")
                                .tracking(-2)
                                .font(.largeTitle)
                            
                            Text("Combined textstyle & weight in one modifier Combined textstyle & weight in one modifier Combined textstyle & weight in one modifier")
                                .font(.system(.title, design: .monospaced))
                                .italic()
                                .strikethrough(modifierActive, color: .green)
                                .bold()
                                .underline(modifierActive, color: .green)
                                .padding(.bottom, 12)
                                .allowsTightening(true)
                                .lineLimit(2)
                                .minimumScaleFactor(0.9)
                                .truncationMode(.middle)
                                .lineSpacing(16.0)
                                .multilineTextAlignment(.trailing)
                            
                            Text("Can you ")
                                .font(.title)
                                .foregroundStyle(.green)
                            + Text("Really combine ")
                                .font(.title2)
                                .foregroundStyle(.blue)
                                .baselineOffset(-8)
                            + Text("Text without ")
                                .font(.title3)
                                .fontWeight(.heavy)
                            + Text("Group?")
                                .font(.caption)
                                .fontDesign(.monospaced)
                            + Text("\n\n")
                            + Text("The answer is YES!")
                                .foregroundStyle(.pink)
                                .font(
                                    .custom(
                                        "Avenir Next",
                                        size: 16,
                                        relativeTo: .footnote
                                    )
                                    .uppercaseSmallCaps()
                                )
                            
                            
                        }
                    }
                }
            }
        }
    }
}

struct EditPersonNameView: View {
    @Binding var person: Person
    
    var body: some View {
        VStack {
            Group {
                TextField("First name", text: $person.firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Last name", text: $person.lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
            }
            .padding(.horizontal)
            .navigationTitle("Edit name")
            .navigationBarTitleDisplayMode(.large)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mint)
    }
}

#Preview {
    BindingWithList()
}
