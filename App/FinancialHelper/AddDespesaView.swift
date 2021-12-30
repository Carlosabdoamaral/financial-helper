//
//  AddDespesaView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

struct AddDespesaView: View {
    @Environment(\.managedObjectContext) var moc
    @StateObject private var dataController = DataController()
    
    @State private var date : Date = Date()
    @State private var details : String = ""
    @State private var haveParcela : Bool = false
    @State private var arrParcelas : [Int] = [0]
    @State private var parcela : Int64 = 0
    @State private var value : String = ""
    @State private var selectedPayment = Payment.boleto
    
    enum Payment: String, Codable, Identifiable {
        case mastercard
        case boleto
        
        var id : String {self.rawValue}
    }
    
    func addDespesa() {
        let financial = Financial(context: moc)
        financial.data = date
        financial.id = UUID()
        financial.parcelas = parcela
        financial.type = "despesa"
        financial.value = value
        financial.desc = details
        financial.paymentType = ""
        
        try? moc.save()
    }
    
    func addParcelas() {
        for i in 0..<100 {
            arrParcelas.append(i)
        }
    }
    
    func increment() {
        if parcela >= arrParcelas.count {
            parcela = 0
        } else {
            parcela += 1
        }
    }
    
    func decrement() {
        if parcela <= 0 {
            parcela = 0
        } else {
            parcela -= 1
        }
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
                    
                    Toggle(isOn: $haveParcela) {
                        Text("Possui parcelas?")
                    }
                    if haveParcela {
                        Stepper {
                            Text("Parcelas: \(parcela)")
                        } onIncrement: {
                            increment()
                        } onDecrement: {
                            decrement()
                        }
                    }
                    
                    Picker("Método de pagamento", selection: $selectedPayment) {
                        
                        Text("Boleto").tag(Payment.boleto)
                        Text("Mastercard").tag(Payment.mastercard)
                    }
                    
                }

                Section(header: Text("Descrição")) {
                    TextEditor(text: $details)
                }
                
                
                Button("Salvar") {
                    addDespesa()
                }
            }
        }
        .navigationTitle("Receita")
        .onAppear {
            addParcelas()
        }
    }
}

struct AddDespesaView_Previews: PreviewProvider {
    static var previews: some View {
        AddDespesaView()
    }
}
