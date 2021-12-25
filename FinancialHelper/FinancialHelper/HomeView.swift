//
//  HomeView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
//    @Environment(\.managedObjectContext) private var homeContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Receita.value, ascending: true)],
        animation: .default)
    private var receitas: FetchedResults<Receita>
    
    
    @State private var haveNotification : Bool = false
    @State private var isShowingNotifications : Bool = false
    @State private var isAdding : Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical) {
                    VStack {
                        
                        if !receitas.isEmpty {
                            ForEach(receitas) { receita in
                                
                                NavigationLink(destination: FinancialDetailsView()) {
                                    FinancialItemHome()
                                }
                                Divider()
                            }
                        } else {
                            Text("Nada por enquanto")
                        }
                    }
                }
            }
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
