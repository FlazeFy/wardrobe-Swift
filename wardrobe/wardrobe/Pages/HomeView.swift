//
//  HomeView.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 13/09/25.
//

import SwiftUI

struct HomeView: View {
    @State private var clothesTypes: [FetchStats]? = nil
    @State private var isLoading = true
    @State private var showError = false

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading Summary...")
            } else {
                if let dt = clothesTypes {
                    TotalClothesByTypeList(clothesTypes: dt)
                }
            }
        }
        .onAppear {
            let group = DispatchGroup()
            isLoading = true
            showError = false

            group.enter()
            R_Stats.shared.getTotalClothesByType { res in
                DispatchQueue.main.async {
                    self.clothesTypes = res
                    group.leave()
                }
            }
            
            group.notify(queue: .main) {
                self.isLoading = false
                if clothesTypes == nil {
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
    }
}

#Preview {
    HomeView()
}
