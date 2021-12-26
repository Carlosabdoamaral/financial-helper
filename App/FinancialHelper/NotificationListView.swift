//
//  NotificationListView.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

struct NotificationListView: View {
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack {
                    ForEach(0..<20) { j in
                        NotificationItem()
                        Divider()
                    }
                }
            }
        }
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView()
    }
}
