//
//  A_Text.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 13/09/25.
//

import Foundation
import SwiftUI

struct AtomText: View {
    var text: String
    var isTitle: Bool = false
    var fontSize: Font? = nil
    
    var body: some View {
        if isTitle {
            Text(text)
                .font(fontSize ?? .title)
                .fontWeight(.bold)
        } else {
            Text(text)
                .font(.subheadline)
        }
    }
}
