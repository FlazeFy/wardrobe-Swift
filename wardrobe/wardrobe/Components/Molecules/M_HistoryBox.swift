//
//  M_HistoryBox.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 13/09/25.
//

import Foundation
import SwiftUI

struct HistoryBox: View {
    @State var id: String
    @State var historyType: String
    @State var historyContext: String
    @State var createdAt: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            AtomText(text: "\(historyType) \(historyContext)", isTitle:true, fontSize: .subheadline)
            AtomText(text: "At \(createdAt)", isTitle:false).italic().foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2) 
    }
}
