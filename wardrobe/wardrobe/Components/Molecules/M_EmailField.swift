//
//  M_EmailField.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 12/09/25.
//

import Foundation
import SwiftUI

struct EmailField: View {
    @Binding var username: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            TextInputField(
                title: "Username",
                placeholder: "ex : flazefy",
                text: $username
            )
            
            Text("We'll never share your email with anyone else")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}
