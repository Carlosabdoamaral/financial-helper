//
//  FinancialHelperApp.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

@main
struct FinancialHelperApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            TabView {
                HomeView()
                    .tabItem {
                        VStack {
                            Image(systemName: "house")
                            Text("Menu")
                        }
                    }
                
                SettingsView()
                    .tabItem {
                        VStack {
                            Image(systemName: "gear")
                            Text("Ajustes")
                        }
                    }
            }
        }
    }
}