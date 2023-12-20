//
//  LaunchScreenStateManager.swift
//  JoinMeOnMyBigDay
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 20/11/2023.
//

import Foundation
final class LaunchScreenStateManager: ObservableObject {
    
    @MainActor @Published private(set) var state: LaunchScreenStep = .firstStep
    @MainActor @Published private(set) var isUserLoggedIn: Bool = false
    
    
    @MainActor func dismiss() {
        Task {
            state = .secondStep
            try? await Task.sleep(for: Duration.seconds(1))
            self.state = .finished
        }
    }
    
    @MainActor func updateLoggedInState(state: Bool) {
        Task {
            self.isUserLoggedIn = state
        }
    }
    
}

