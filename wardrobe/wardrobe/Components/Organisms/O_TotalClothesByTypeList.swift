//
//  O_TotalClothesByTypeList.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 13/09/25.
//

import Foundation
import SwiftUI

struct TotalClothesByTypeList: View {
    var clothesTypes: [FetchStats]
    
    var body: some View {
        VStack(spacing: 10) {
            AtomHeading(text: "All Types")
            ForEach(clothesTypes, id: \.context) { dt in
                HStack {
                    Spacer()
                    Text("\(dt.total) \(dt.context)")
                        .fontWeight(.semibold)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "#00a6e1"), Color(hex: "#ace5e8")]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        )
        .padding(16)
    }
}
