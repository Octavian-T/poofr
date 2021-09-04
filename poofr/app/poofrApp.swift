//
//  poofrApp.swift
//  poofr
//
//  Created by Octavian Tabacaru on 07/08/2021.
//

import SwiftUI

@main
struct poofrApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(\.colorScheme, .dark)
        }
    }
}
