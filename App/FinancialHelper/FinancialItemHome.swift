//
//  FinancialItemHome.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

struct FinancialItemHome: View {
    
    public var type : String?
    public var value : String?
    public var data : Date?
    

    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
//                Text("\(data ?? Date())")
//                    .font(.subheadline)
                
                if type == "receita" {
                    Text("Receita").italic()
                        .foregroundColor(Color.green)
                }
                else if type == "despesa" {
                    Text("Despesa").italic()
                        .foregroundColor(Color.red)
                }
                else if type == "poupanca" {
                    Text("Ganhos Poupaça").italic()
                        .foregroundColor(Color.yellow)
                }
                
                Text("R$\(value ?? "00.00")")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    
            }
            Spacer()
            
        }
        .padding()
    }
}

struct FinancialItemHome_Previews: PreviewProvider {
    static var previews: some View {
        FinancialItemHome()
            .previewLayout(.sizeThatFits)
    }
}
