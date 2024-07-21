//
//  ContentView.swift
//  WeSplit
//
//  Created by Christian Bringino on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @State private var modifierActive: Bool = true
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let perPerson = grandTotal / peopleCount
        return perPerson
    }
    
    var tipValue: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        
        return tipValue
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    let currency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: .currency(code: currency)
                    )
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.automatic)
                }
                
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    
                    HStack {
                        Text("Tip amount:")
                        Text(tipValue, format: .currency(code: currency))
                            .foregroundStyle(tipValue <= 0 ? .red : .black)
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Total amount") {
                    Text("Check + Tip = ")
                    + Text(checkAmount + tipValue, format: .currency(code: currency))
                }
                
                Section("Amount per person") {
                    Text(
                        totalPerPerson,
                        format: .currency(code: currency)
                    )
                }
            }
            .navigationTitle("We Split")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
