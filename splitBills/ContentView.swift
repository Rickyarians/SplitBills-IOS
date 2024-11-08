//
//  ContentView.swift
//  splitBills
//
//  Created by Ricky Ariansyah on 09/11/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    @State private var name = ""
    @State private var counting = 0
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Settingan Rata Kiris")) {
                    TextField("Enter your name", text: $name)
                        .onChange(of: name) { oldValue, newValue in
                            print("kocak \(newValue)")
                        }
                    Text("\(name)")
                   Text("\(selectedStudent)")
                }
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    ForEach(0..<10) {
                        number in
                        Text("Hello World! \(String(number + 1))")
                    }
                }
                
                Button("tap count \(String(counting))") {
                    counting += 1
                }
            }.navigationTitle("SwiftUI")
                .navigationBarTitleDisplayMode(.inline)
        }
            
       
    }
}


#Preview {
    ContentView()
}
