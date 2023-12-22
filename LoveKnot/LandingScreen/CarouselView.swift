//
//  CarouselView.swift
//  LoveKnot
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 20/12/2023.
//

import SwiftUI

struct CarouselView: View {
    var event: WeddingEventType
    var body: some View {
        ScrollView {
            Theme.backgroundColor
            List {
                Section() {
                    Text("Fdffd").bodyStyle()
                }
                Section() {
                    Text("fdfd").bodyStyle()
                }
            }
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(event:.mehendi)
    }
}
