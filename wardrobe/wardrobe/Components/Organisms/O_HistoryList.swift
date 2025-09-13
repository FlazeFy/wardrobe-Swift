//
//  O_HistoryList.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 13/09/25.
//

import Foundation
import SwiftUI

struct HistoryList: View {
    var histories: [FetchAllHistory]
    
    var body: some View {
        VStack(spacing: 10) {
            AtomHeading(text: "My History")
            ForEach(histories, id: \.id) { dt in
                HistoryBox(id: dt.id, historyType: dt.historyType, historyContext: dt.historyContext, createdAt: dt.createdAt)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
        .padding(10)
    }
}
