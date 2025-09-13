//
//  O_ClothesSummaryBox.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 13/09/25.
//

import Foundation
import SwiftUI

struct ClothesSummaryBox: View {
    var clothesSummary: FetchClothesSummary
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                VStack {
                    HStack {
                        Spacer()
                        Text("\(clothesSummary.totalClothes)")
                        Text("Variety").foregroundColor(.white)
                    }
                    HStack {
                        Spacer()
                        Text("\(clothesSummary.sumClothesQty)")
                        Text("Quantity").foregroundColor(.white)
                    }
                }.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                AtomHeading(text: "Total Clothes")
            }
            HStack {
                AtomHeading(text: "The Price")
                VStack {
                    HStack {
                        Text("Rp. \(ConvertedPriceK(clothesSummary.maxPrice))K")
                        Text("Most Expensive").foregroundColor(.white)
                        Spacer()
                    }
                    HStack {
                        Text("Rp. \(ConvertedPriceK(clothesSummary.avgPrice))K")
                        Text("Average").foregroundColor(.white)
                        Spacer()
                    }
                }.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
