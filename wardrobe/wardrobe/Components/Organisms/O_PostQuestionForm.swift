//
//  O_PostQuestionForm.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 17/09/25.
//

import Foundation
import SwiftUI

struct PostQuestionForm: View {
    @State private var question: String = ""
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                AtomText(text: "Ask A Question",isTitle: true,fontSize: Font.headline)
                AtomText(text: "If you confused about how our apps work, or just want to make sure. Feel free to ask!",isTitle: false,fontSize: Font.caption)
                TextInputField(title:nil, placeholder:"", text: $question)
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                PrimaryButton(label: isLoading ? "Loading..." : "Send Question") {
                   submit()
                }
            }
            .padding(20)
            .cornerRadius(20)
            .background(Color(hex: "#F3F3F3")
            .ignoresSafeArea())
        }
    }
    
    private func submit() {
        errorMessage = nil
        isLoading = true
        
        QuestionRepository.shared.postQuestion(question: question) { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let response):
                    if response.status == "success" {
                        // do something
                    } else {
                        errorMessage = "Something went wrong"
                    }
                case .failure(let error):
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}
