//
//  Style.swift
//  JoinMeOnMyBigDay
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 20/11/2023.
//

import Foundation
import SwiftUI

enum Theme {
    static var backgroundColor: some View {
       Color.mint.ignoresSafeArea()
   }
}

struct BodyStyleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.black)
            .fontDesign(.serif)
            .multilineTextAlignment(.leading)
    }
}

struct TitleStyleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.accentColor)
            .fontDesign(.serif)
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
    }
}
    
struct HeadlineStyleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.accentColor)
            .fontDesign(.serif)
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
    }
}

struct SubHeadlineStyleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundColor(.accentColor)
            .fontDesign(.serif)
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
    }
}

extension View {
    
    func titleStyle() -> some View {
        modifier(TitleStyleModifier())
    }
    
    func bodyStyle() -> some View {
        modifier(BodyStyleModifier())
    }
    
    func headlineStyle() -> some View {
        modifier(HeadlineStyleModifier())
    }
    
    func subHeadlineStyle() -> some View {
        modifier(SubHeadlineStyleModifier())
    }
}
