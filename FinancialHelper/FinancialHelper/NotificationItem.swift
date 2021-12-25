//
//  NotificationItem.swift
//  FinancialHelper
//
//  Created by Carlos Amaral on 25/12/21.
//

import SwiftUI

struct NotificationItem: View {
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                Text("Title")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                Text("aaaa")
                    .fontWeight(.thin)
            }
            Spacer()
        }
        .padding()
    }
}

struct NotificationItem_Previews: PreviewProvider {
    static var previews: some View {
        NotificationItem()
            .previewLayout(.sizeThatFits)
    }
}
