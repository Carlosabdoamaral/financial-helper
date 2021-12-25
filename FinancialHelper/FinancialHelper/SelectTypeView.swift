//
//  SelectTypeView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

struct SelectTypeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    NavigationLink(destination: AddReceitaView()) {
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "dollarsign.square.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .scaledToFit()
                                    .foregroundColor(Color.white)
                                
                                Text("Receita")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color.green)
                        .cornerRadius(5)
                    }
                    
                    NavigationLink(destination: AddDespesaView()) {
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "dollarsign.square.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .scaledToFit()
                                    .foregroundColor(Color.white)
                                
                                Text("Despesa")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color.red)
                        .cornerRadius(5)
                    }
                    
                    NavigationLink (destination: AddPoupancaView()) {
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "dollarsign.square.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .scaledToFit()
                                    .foregroundColor(Color.white)
                                
                                Text("Poupança")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(5)
                    }
                    
                    
                }
                .padding()
            }
            .navigationTitle("Selecione")
        }
    }
}

struct SelectTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTypeView()
    }
}
