//
//  FinancialDetailsView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

struct FinancialDetailsView: View {
    
    private var value : Double = 226.43
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                
                GroupBox {
                    HStack {
                        HStack(spacing: 7) {
                            Text("Valor:")
                            Text("R$\(value.formatted())")
                                .fontWeight(.bold)
                        }
                        Spacer()
                    }
                }
                
                GroupBox {
                    HStack {
                        Text("Tipo: ")
                        Spacer()
                    }
                }
                
                GroupBox {
                    HStack {
                        Text("Data: ")
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
