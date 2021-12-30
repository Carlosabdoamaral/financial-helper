//
//  DashboardView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 30/12/21.
//

import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    Spacer()
                    
                    VStack {
                        Text("R$225.00")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Total")
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("R$225.00")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Poupança")
                    }
                    
                    Spacer()
                    
                }
            }
            .navigationTitle("Resumo")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
