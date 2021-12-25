//
//  FinancialItemHome.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

struct FinancialItemHome: View {
    
    private var type : Int = 1
    private var category : String = "Alimentação"
    private var value : Double = 226.43
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                if type == 0 {
                    Text("Receita").italic()
                        .foregroundColor(Color.green)
                }
                else if type == 1 {
                    Text("Despesa - \(category)").italic()
                        .foregroundColor(Color.red)
                }
                else if type == 2 {
                    Text("Ganhos Poupaça").italic()
                        .foregroundColor(Color.yellow)
                }
                
                Text("R$\(value.formatted())")
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
