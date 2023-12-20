//
//  LoginView.swift
//  JoinMeOnMyBigDay
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 19/12/2023.
//

import SwiftUI

enum LoginState {
    case failed
    case success
    case inProgress
    case notStarted
}

protocol LoginViewViewModelType {
    var title: String { get set }
    func buttonTapped(email: String, password: String)
}

final class LoginScreenViewModel: ObservableObject, LoginViewViewModelType {
    @Published var title = "Let's get you logged in!"
    @Published var state: LoginState = .notStarted
    
    private var email: String?
    private var password: String?

    func buttonTapped(email: String, password: String) {
        self.email = email
        self.password = password
        // login perform
        state = .success
    }
}

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false

    @ObservedObject private var viewModel: LoginScreenViewModel = LoginScreenViewModel()
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    
    private var isSignInButtonDisabled: Bool {
        [email, password].contains(where: \.isEmpty)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            
            Spacer()
            Text("Welcome")
                .titleStyle()
            
            Text(viewModel.title)
                .headlineStyle()
            
            
            TextField("Email",
                      text: $email ,
                      prompt: Text("Email address").foregroundColor(.dustyPink)
            )
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.dustyPink, lineWidth: 2)
            }
            .padding(.horizontal)
            
            HStack {
                Group {
                    if showPassword {
                        TextField("Password", // how to create a secure text field
                                  text: $password,
                                  prompt: Text("Password").foregroundColor(.dustyPink)) // How to change the color of the TextField Placeholder
                    } else {
                        SecureField("Password", // how to create a secure text field
                                    text: $password,
                                    prompt: Text("Password").foregroundColor(.dustyPink)) // How to change the color of the TextField Placeholder
                    }
                }
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.dustyPink, lineWidth: 2) // How to add rounded corner to a TextField and change it colour
                }
                
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.dustyPink)
                }
                
            }.padding(.horizontal)
            
            Spacer()
            
            PrimaryButton(title: "let's go!", isButtonDisabled: isSignInButtonDisabled) {
                viewModel.buttonTapped(email: email, password: password)
            }.padding()
            
            var cancellable =  viewModel.$state.sink (receiveValue: {  state in
                if state == .success {
                    self.launchScreenState.updateLoggedInState(state: true)
                }
            })
            
        }.task {
            try? await Task.sleep(for: Duration.seconds(2))
            self.launchScreenState.dismiss()
        }.background(
            LinearGradient(gradient: Gradient(colors: [.cream, .white]), startPoint: .top, endPoint: .bottom)
              .edgesIgnoringSafeArea(.all))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(LaunchScreenStateManager())
    }
}
