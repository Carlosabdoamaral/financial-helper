//
//  AddPoupancaView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

struct AddPoupancaView: View {
    @State private var date : Date = Date()
    @State private var details : String = ""
    @State private var value : String = ""
    
    func addPoupanca() {print(true)}
    
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
