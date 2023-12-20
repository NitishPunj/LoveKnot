//
//  LoveKnotApp.swift
//  LoveKnot
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 20/12/2023.
//

import SwiftUI

@main
struct LoveKnotApp: App {
    @StateObject var launchScreenState = LaunchScreenStateManager()
    var body: some Scene {
        WindowGroup {
            ZStack {
                HomeView().opacity(launchScreenState.isUserLoggedIn ? 1 : 0)
                LoginView().opacity(launchScreenState.isUserLoggedIn ? 0 : 1)
                if launchScreenState.state != .finished {
                    SplashView()
                }
            }.environmentObject(launchScreenState)
        }
    }
}
// test
