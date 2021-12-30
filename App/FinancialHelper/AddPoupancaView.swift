//
//  AddPoupancaView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

struct AddPoupancaView: View {
    @Environment(\.managedObjectContext) var moc
    @StateObject private var dataController = DataController()
    
    @State private var date : Date = Date()
    @State private var details : String = ""
    @State private var value : String = ""
    
    func addPoupanca() {
        let financial = Financial(context: moc)
        financial.data = date
        financial.id = UUID()
        financial.parcelas = 0
        financial.type = "poupanca"
        financial.value = value
        financial.desc = details
        financial.paymentType = ""
        
        try? moc.save()
    }
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Sobre")) {
                    TextField("Insira o valor", text: $value)
                    DatePicker(
                        "Data",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                }

                Section(header: Text("Descrição")) {
                    TextEditor(text: $details)
                }
                
                
                Button("Salvar") {
                    addPoupanca()
                }
            }
        }
        .navigationTitle("Poupança")
        
    }
}

struct AddPoupancaView_Previews: PreviewProvider {
    static var previews: some View {
        AddPoupancaView()
    }
}
