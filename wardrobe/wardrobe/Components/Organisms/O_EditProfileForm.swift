//
//  O_EditProfileForm.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 17/09/25.
//

import Foundation
import SwiftUI

struct EditProfileForm: View {
    var profile: FetchMyProfile
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var telegramUserID: String = ""
    
    init(profile: FetchMyProfile) {
        self.profile = profile
        _username = State(initialValue: profile.username)
        _email = State(initialValue: profile.email)
        _telegramUserID = State(initialValue: profile.telegramUserId ?? "")
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AtomText(text: "Edit Profile",isTitle: true,fontSize: Font.headline)
            
            VStack(alignment: .leading, spacing: 4) {
                TextInputField(title:"Username", placeholder:"Username", text: $username)
                TextInputField(title:"Email", placeholder:"Email", text: $email)
                TextInputField(title:"Telegram User ID", placeholder:"Telegram User ID", text: $telegramUserID)
            }
        }
        .padding()
        .cornerRadius(18)
    }
}
