//
//  SettingsView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var dataController = DataController()
    @FetchRequest(sortDescriptors: []) var user : FetchedResults<User>
    
    @State private var selectedNotification = NotificationsType.Todas
    @State private var selectedCurrency = Currency.real
    
    
    enum NotificationsType: String, Codable, Identifiable {
        case Todas
        case Necessário
        case Nenhuma
        
        var id : String {self.rawValue}
    }
    
    enum Currency : String, Codable, Identifiable {
        case real
        case dolar
        
        var id : String {self.rawValue}
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: ProfileView()) {
                        VStack(alignment: .leading) {
                            
                            if user.count != 0 {
                                
                                ForEach(user) { u in
                                    Text(u.username!)
                                        .font(.title3)
                                        .lineLimit(1)
                                    Text(u.email!)
                                        .font(.body)
                                        .fontWeight(.light)
                                        .lineLimit(1)
                                }
                            } else {
                                Text("Erro")
                            }
                        }
                    }
                    .padding(.vertical)
                }
                
                Section {
                    Picker("Notificações", selection: $selectedNotification) {
                        Text("Todas").tag(NotificationsType.Todas)
                        Text("Apenas as necessárias").tag(NotificationsType.Necessário)
                        Text("Nenhuma").tag(NotificationsType.Nenhuma)
                    }
                    
                    Picker("Modela Local", selection: $selectedCurrency) {
                        Text("R$").tag(Currency.real)
                        Text("USD").tag(Currency.dolar)
                    }
                }
                
                Button {
                    print("Sair")
                } label: {
                    HStack(spacing: 15) {
                        Text("Sair")
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                    .foregroundColor(Color.red)
                }
                
            }
            .navigationTitle("Ajustes")
            .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
