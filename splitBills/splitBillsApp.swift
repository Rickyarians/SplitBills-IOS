//
//  splitBillsApp.swift
//  splitBills
//
//  Created by Ricky Ariansyah on 09/11/24.
//

import SwiftUI

@main
struct splitBillsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
