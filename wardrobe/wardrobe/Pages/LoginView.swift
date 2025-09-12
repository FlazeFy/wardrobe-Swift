//
//  LoginView.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 12/09/25.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#99cde1")
                        .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 20) {
                    VStack(alignment: .center, spacing: 8) {
                        Text("Hello There!!!")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text("Do you have an account? type your username and password to proceed sign in, so you can using this apps")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 20)
                    
                   
                    LoginForm(username: $username, password: $password)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 6)
                .padding(.horizontal, 24)
            }
        }
    }
}

#Preview {
    LoginView()
}
