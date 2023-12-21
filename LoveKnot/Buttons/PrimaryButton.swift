//
//  PrimaryButton.swift
//  LoveKnot
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 20/12/2023.
//

import SwiftUI

typealias EmptyStateActionHandler = () -> Void

enum ButtonConfiguration {
    case primary
    case secondary
}

struct ActionButton: View {
    private let handler: EmptyStateActionHandler
    private var title: String
    private var isButtonDisabled: Bool
    private let buttonConfiguration: ButtonConfiguration
    
    var foregroundColor: Color {
        switch (isButtonDisabled, buttonConfiguration) {
        case (true, .primary):
            return .dustyPink
        case (false, .primary):
            return .white
        case (true, .secondary):
            return .mint
        case (false, .secondary):
            return .white
        }
    }
    
    internal init(title: String,
                  isButtonDisabled: Bool,
                  handler: @escaping EmptyStateActionHandler,
                  buttonConfiguration: ButtonConfiguration = .primary) {
        self.handler = handler
        self.isButtonDisabled = isButtonDisabled
        self.title = title
        self.buttonConfiguration = buttonConfiguration
    }
    
    var body: some View {
        Button {
            handler()
        } label: {
            Text(title)
                .foregroundColor(foregroundColor)
                .fontDesign(.serif)
        }
        .fontDesign(.serif)
        .frame(height: 50)
        .frame(maxWidth: .infinity) // to make a button fill all the space available horizontally
        .background(
            isButtonDisabled ?
            LinearGradient(colors: [.cream], startPoint: .topLeading, endPoint: .bottomTrailing) :
                LinearGradient(colors: [.dustyPink, .chocolate], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(20)
        .disabled(isButtonDisabled)
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(title: "Primary button", isButtonDisabled: false) {}
    }
}
