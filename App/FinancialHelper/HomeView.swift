//
//  HomeView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import CoreData
import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "data", ascending: false)]) var financial : FetchedResults<Financial>
    
    @StateObject private var userController = UserController()
    @StateObject private var dataController = DataController()
    
    @State private var haveNotification : Bool = false
    @State private var isShowingNotifications : Bool = false
    @State private var isAdding : Bool = false
    
    func addUser() {
        
        let username = "Carlosamaral._"
        let email = "Carlosabdoamaral@icloud.com"
        let password = "Senha_admin123"
        
        let userModel = User(context: moc)
        userModel.id = UUID()
        userModel.username = username
        userModel.email = email
        userModel.password = password
        
        try? moc.save()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical) {
                    VStack {
                        
                        if financial.count != 0{
                            ForEach(financial) { item in
                                
                                NavigationLink(destination: FinancialDetailsView(value: item.value, type: item.type, data: item.data, desc: item.desc)) {
                                    FinancialItemHome(type: item.type, value: item.value, data: item.data)
                                }
                                
                                Divider()
                            }
                        } else {
                            Text("Nada por enquanto")
                        }
                        
//                        Button("Add") {
//                            let firstName = ["Carlos", "Anderson", "Rafael", "Jeferson", "Charles"]
//                            let lastName = ["Alberto", "Cardoso", "Amaral", "Santos"]
//                            
//                            let firstSelected = firstName.randomElement()!
//                            let lastSelected = lastName.randomElement()!
//                             
//                            let item = Financial(context: moc)
//                            item.id = UUID()
//                            item.value = "\(firstSelected) \(lastSelected)"
//                            
//                            try? moc.save()
//                        }
                    }
                }
            }
            .onAppear(perform: {
                addUser()
            })
            .navigationBarTitle("Menu")
            .navigationBarItems(
                leading: HStack {
                    if haveNotification {
                        Image(systemName: "bell.fill")
                            .onTapGesture {
                                self.isShowingNotifications = true
                            }
                            .sheet(isPresented: $isShowingNotifications, onDismiss: {
                                self.isShowingNotifications = false
                            }) {
                                NotificationListView()
                            }
                    } else {
                        Image(systemName: "bell")
                    }
                },
                trailing: HStack {
                    Image(systemName: "plus")
                        .onTapGesture {
                            self.isAdding = true
                        }
                        .sheet(isPresented: $isAdding) {
                            self.isAdding = false
                        } content: {
                            SelectTypeView()
                        }

                }
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
