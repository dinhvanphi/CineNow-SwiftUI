//
//  CineNowApp.swift
//  CineNow
//
//  Created by Đinh Văn Phi on 15/1/26.
//

import SwiftUI
import CoreData

@main
struct CineNowApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
