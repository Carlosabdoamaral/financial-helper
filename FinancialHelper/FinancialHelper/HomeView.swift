//
//  HomeView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

struct HomeView: View {
    @State private var haveNotification : Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(0..<15) { k in
                            
                            NavigationLink(destination: FinancialDetailsView()) {
                                FinancialItemHome()
                            }
                            Divider()
                        }
                    }
                }
            }
            .navigationBarTitle("Menu")
            .navigationBarItems(
                leading: HStack {
                    if haveNotification {
                        Image(systemName: "bell.fill")
                    } else {
                        Image(systemName: "bell")
                    }
                },
                trailing: HStack {
                    Image(systemName: "plus")
                }
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
