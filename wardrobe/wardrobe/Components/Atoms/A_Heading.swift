//
//  A_Heading.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 12/09/25.
//

import Foundation
import SwiftUI

struct AtomHeading: View {
    var text: String
    var lineWidth: CGFloat = 1
    
    var body: some View {
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(Color(hex: "#00a6e1"))
            .shadow(color: .white, radius: 0, x:  lineWidth, y:  0)
            .shadow(color: .white, radius: 0, x: -lineWidth, y:  0)
            .shadow(color: .white, radius: 0, x:  0, y:  lineWidth)
            .shadow(color: .white, radius: 0, x:  0, y: -lineWidth)
            .shadow(color: .white, radius: 0, x:  lineWidth, y:  lineWidth)
            .shadow(color: .white, radius: 0, x: -lineWidth, y: -lineWidth)
            .shadow(color: .white, radius: 0, x:  lineWidth, y: -lineWidth)
            .shadow(color: .white, radius: 0, x: -lineWidth, y:  lineWidth)
    }
}
