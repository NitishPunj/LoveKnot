//
//  PrimaryButton.swift
//  LoveKnot
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 20/12/2023.
//

import SwiftUI

typealias EmptyStateActionHandler = () -> Void

struct PrimaryButton: View {
    private let handler: EmptyStateActionHandler
    private var title: String
    private var isButtonDisabled: Bool
    
    internal init(title: String,
                  isButtonDisabled: Bool,
                  handler: @escaping EmptyStateActionHandler) {
        self.handler = handler
        self.isButtonDisabled = isButtonDisabled
        self.title = title
    }
    
    var body: some View {
        Button {
            handler()
        } label: {
            Text(title)
                .foregroundColor(isButtonDisabled ? .dustyPink : .white)
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity) // how to make a button fill all the space available horizontally
        .background(
            isButtonDisabled ?
            LinearGradient(colors: [.cream], startPoint: .topLeading, endPoint: .bottomTrailing) :
                LinearGradient(colors: [.dustyPink, .chocolate], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(20)
        .disabled(isButtonDisabled)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Primary button", isButtonDisabled: false) {}
    }
}
