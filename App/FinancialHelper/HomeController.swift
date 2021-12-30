//
//  ReceitaController.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 30/12/21.
//

import Foundation
import CoreData

class HomeController : ObservableObject {
    let container = NSPersistentContainer(name: "Receita")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
