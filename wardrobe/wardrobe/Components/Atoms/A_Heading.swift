//
//  A_Heading.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 12/09/25.
//

import Foundation
import SwiftUI

struct Heading: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.top, 8)
    }
}
