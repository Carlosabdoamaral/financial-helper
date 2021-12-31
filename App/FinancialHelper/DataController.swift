//
//  DataController.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 30/12/21.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FinancialData")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data error while loading \(error.localizedDescription)")
            }
        }
    }
}

class UserController : ObservableObject {
    let userContainer = NSPersistentContainer(name: "UserData")
    
    init() {
        userContainer.loadPersistentStores { description, error in
            if let error = error {
                print("Core data error while loading \(error.localizedDescription)")
            }
        }
    }
}
