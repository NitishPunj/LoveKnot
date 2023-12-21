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
        Color(red: 250, green: 244, blue: 235).ignoresSafeArea()
   }
}

extension Color {
    static var dustyPink: Color {
        Color("DustyPink")
    }
    
    static var cream: Color {
        Color("Cream")
    }
    static var chocolate: Color {
        Color("Chocolate")
    }
}

struct BodyStyleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.dustyPink)
            .fontDesign(.serif)
            .multilineTextAlignment(.leading)
    }
}

struct TitleStyleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.chocolate)
            .fontDesign(.serif)
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
    }
}
    
struct HeadlineStyleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.dustyPink)
            .fontDesign(.serif)
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
    }
}

struct SubHeadlineStyleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundColor(.dustyPink)
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
