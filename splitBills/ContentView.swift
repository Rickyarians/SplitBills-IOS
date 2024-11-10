//
//  ContentView.swift
//  splitBills
//
//  Created by Ricky Ariansyah on 09/11/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipePErcentage = 20
    @FocusState private var amountIsFocused: Bool

    let tipPercentage = [10, 15, 20, 25, 0]
    
    var totalPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipsSelection = Double(tipePErcentage)
        
        let tipvalue = checkAmount / 100 * tipsSelection
        let grandTotal = checkAmount + tipvalue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    

    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "IDR"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number Of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                Section("How much do you want to tip?") {
                   
                    Picker("Tip Percentage", selection: $tipePErcentage) {
                        ForEach(0..<101, id: \.self){
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                Section("Total Amount") {
                    Text((Double(checkAmount) * (Double(tipePErcentage + 100)/100)), format: .currency(code: Locale.current.currency?.identifier ?? "IDR"))
                }
                
                
                Section("Amount Per Person") {
                    Text(totalPerson, format: .currency(code: Locale.current.currency?.identifier ?? "IDR"))
                }
            }.navigationTitle("Split")
                .navigationBarTitleDisplayMode(.automatic)
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
