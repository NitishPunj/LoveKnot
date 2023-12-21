//
//  CarouselView.swift
//  LoveKnot
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 20/12/2023.
//

import SwiftUI

struct CarouselView: View {
    var body: some View {
        ScrollView {
            Theme.backgroundColor
            List {
                Section() {
                    
                }
                Section() {
                    
                }
            }
            
        }
    }
}
//
//var body: some View {
//        ZStack {
//            GeometryReader { proxy in
//                            Image.homePage
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: proxy.size.width, height: proxy.size.height)
//                    }.ignoresSafeArea()
//            ScrollView {
//                VStack (alignment: .center) {
//                    Spacer(minLength: 200)
//                    Text("Neha & Nitish")
//                        .titleStyle()
//
//                    Text("are getting married!")
//                        .titleStyle()
//                    Image("couple image")
//
//                        .resizable()
//                        .imageScale(.large)
//                }
//            }
//        }
//}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
