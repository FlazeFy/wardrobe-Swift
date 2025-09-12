//
//  M_PasswordField.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 12/09/25.
//

import Foundation
import SwiftUI

struct PasswordField: View {
    @Binding var password: String
    
    var body: some View {
        TextInputField(
            title: "Password",
            placeholder: "ex : nopass123",
            text: $password,
            isSecure: true
        )
    }
}
