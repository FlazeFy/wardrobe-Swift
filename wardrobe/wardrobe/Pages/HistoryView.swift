//
//  HistoryView.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 13/09/25.
//

import SwiftUI

struct HistoryView: View {
    @State private var allHistory: [FetchAllHistory]? = nil
    @State private var isLoading = true
    @State private var showError = false

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading Data...")
            } else {
                if let h = allHistory {
                    HistoryList(histories: h)
                }
            }
        }
        .onAppear {
            let group = DispatchGroup()
            isLoading = true
            showError = false

            group.enter()
            R_History.shared.getAllHistory { res in
                DispatchQueue.main.async {
                    self.allHistory = res
                    group.leave()
                }
            }
            
            group.notify(queue: .main) {
                self.isLoading = false
                if allHistory == nil {
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
    HistoryView()
}
