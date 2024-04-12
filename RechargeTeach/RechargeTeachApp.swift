//
//  RechargeTeachApp.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 1/19/24.
//

import SwiftUI

@main
struct RechargeTeachApp: App {
    let persistentContainer = CoreDataManager.shared.persistentContainer

    var body: some Scene {
        WindowGroup {
            ContentView()
                //.environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
