//
//  FinancialHelperApp.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import CoreData
import SwiftUI

@main
struct FinancialHelperApp: App {
    @Environment(\.managedObjectContext) var moc
    @StateObject private var dataController = DataController()
    @StateObject private var userController = UserController()
    
    @FetchRequest(sortDescriptors: []) var user : FetchedResults<User>
    
    var body: some Scene {
        WindowGroup {

            if false {
                SignUpView()
            } else {
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
}
