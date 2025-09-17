//
//  ProfileView.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 17/09/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var myProfile: FetchMyProfile? = nil
    @State private var isLoading = true
    @State private var showError = false

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading Data...")
            } else {
                if let dt = myProfile {
                    EditProfileForm(profile: dt)
                }
                
                PostQuestionForm()
            }
        }
        .onAppear {
            let group = DispatchGroup()
            isLoading = true
            showError = false

            group.enter()
            R_User.shared.getMyProfile { res in
                DispatchQueue.main.async {
                    self.myProfile = res
                    group.leave()
                }
            }
            
            group.notify(queue: .main) {
                self.isLoading = false
                if myProfile == nil {
                    self.showError = true
                }
            }

        }
        .navigationBarBackButtonHidden(true)
        .alert("Error", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Failed to get the data")
        }
        .padding(12)
    }
}

#Preview {
    ProfileView()
}
