//
//  FinancialDetailsView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

struct FinancialDetailsView: View {
    
    public var value : String?
    public var type : String?
    public var data : Date?
    public var desc : String?
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                
                GroupBox {
                    HStack {
                        HStack(spacing: 7) {
                            Text("Valor:")
                            Text("R$\(value ?? "00.00")")
                                .fontWeight(.bold)
                        }
                        Spacer()
                    }
                }
                
                GroupBox {
                    HStack {
                        Text("Tipo: \(type ?? "Erro")")
                        Spacer()
                    }
                }
                
                GroupBox {
                    HStack {
                        Text("Data: \(data ?? Date())")
                        Spacer()
                    }
                }
                
                GroupBox {
                    HStack {
                        Text("Descrição: \(desc ?? "")")
                        Spacer()
                    }
                }
            }
            .padding()
            Spacer()
        }
        .navigationTitle("Detalhes")
    }
}

struct FinancialDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FinancialDetailsView()
    }
}
