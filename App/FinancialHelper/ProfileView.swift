//
//  ProfileView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Username")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text("Carlosabdoamaral@icloud.com")
                
                Form {
                    ForEach(0..<10) {k in
                        Section {
                            Text("Item \(k)")
                        }
                        .padding()
                    }
                }
                .padding(.top)
                
                Spacer()
                
            }
        }
        .navigationBarItems(trailing: Text("Editar"))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
