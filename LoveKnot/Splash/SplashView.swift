//
//  SplashView.swift
//  JoinMeOnMyBigDay
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 20/11/2023.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager

    @State private var firstAnimation = false  // Mark 2
    @State private var secondAnimation = false // Mark 2
    @State private var startFadeoutAnimation = false // Mark 2
    
    @ViewBuilder
    private var image: some View {  // Mark 3
        Image(systemName: "heart.fill")
            .resizable()
            .foregroundColor(.dustyPink)
            .scaledToFit()
            .frame(width: 100, height: 100)
            .rotationEffect(firstAnimation ? Angle(degrees:360) : Angle(degrees: 0)) // Mark 4
            .scaleEffect(secondAnimation ? 0 : 1) // Mark 4
            .offset(y: secondAnimation ? 400 : 0) // Mark 4
    }
    
    private let animationTimer = Timer // Mark 5
        .publish(every: 0.8, on: .current, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            Theme.backgroundColor
            VStack {
                Text("Neha & Nitish")
                    .titleStyle()
                Text("are getting married!")
                    .titleStyle()
                image
               
            }
            
        }.onReceive(animationTimer) { timerValue in
            updateAnimation()  // Mark 5
        }.opacity(startFadeoutAnimation ? 0 : 1)
    }
    
    private func updateAnimation() { // Mark 5
        switch launchScreenState.state {
        case .firstStep:
            withAnimation(.easeInOut(duration: 0.5)) {
                firstAnimation.toggle()
            }
        case .secondStep:
            if secondAnimation == false {
                withAnimation(.linear) {
                    self.secondAnimation = true
                    startFadeoutAnimation = true
                }
            }
        case .finished:
            // use this case to finish any work needed
            break
        }
    }
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .environmentObject(LaunchScreenStateManager())
    }
}
