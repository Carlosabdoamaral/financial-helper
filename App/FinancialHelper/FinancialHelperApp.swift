//
//  FinancialHelperApp.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

@main
struct FinancialHelperApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                    .tabItem {
                        VStack {
                            Image(systemName: "house")
                            Text("Menu")
                        }
                    }
                
                DashboardView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
                    .tabItem {
                        VStack {
                            Image(systemName: "square.grid.2x2")
                            Text("Resumo")
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
