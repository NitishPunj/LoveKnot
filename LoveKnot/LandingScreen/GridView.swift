//
//  GridView.swift
//  LoveKnot
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 21/12/2023.
//

import SwiftUI

struct GridViewModel: Identifiable {
    var id = UUID()
    var name: String
    var color: Color
}

let sampleGridViewModels = [
    GridViewModel(name: "Wedding ceremony",color: .white),
    GridViewModel(name: "Mehendi", color: .green.opacity(0.2)),
    GridViewModel(name: "Haldi", color: .yellow.opacity(0.2)),
    GridViewModel(name: "Hindu Ceremony", color: .dustyPink.opacity(0.2)),
    GridViewModel(name: "This is us", color: .cream),
    GridViewModel(name: "RSVP", color: .cream)]

struct GridView: View {
    @State var gridLayout: [GridItem] = [ GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
            
            ForEach(sampleGridViewModels.indices, id: \.self) { index  in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                    .fill(sampleGridViewModels[index].color)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 150)
                    //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.chocolate, lineWidth: 0.5))
                    Text(sampleGridViewModels[index].name).titleStyle2Light()
                    
                }
            }
        }
        .padding(.all, 10)
        .background(Color(.white)).ignoresSafeArea()
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
