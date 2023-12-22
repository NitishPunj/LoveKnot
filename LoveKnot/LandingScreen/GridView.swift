//
//  GridView.swift
//  LoveKnot
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 21/12/2023.
//

import SwiftUI

enum GridType {
    case event
    case aboutUs
    case rsvp
}

struct GridViewModel: Identifiable, Hashable {
    var id = UUID()
    var event: WeddingEventType?
    var type: GridType = .event
}

extension GridViewModel {
    var gridTileName: String {
        switch type {
        case .rsvp:
            return "RSVP"
        case .aboutUs:
            return "About us"
        case .event:
            return event?.rawValue ?? ""
        }
    }
    
    var gridTileBackground: Color {
        switch type {
        case .rsvp:
            return .cream
        case .aboutUs:
            return .cream
        case .event:
            switch event! {
            case .civilCeremony:
                return .white
            case .mehendi:
                return .mehndiGreen.opacity(0.8)
            case .haldi:
                return .yellow.opacity(0.2)
            case .hinduCeremony:
                return .dustyPink.opacity(0.2)
                
            }
        }
    }
}

let sampleGridViewModels = [
    GridViewModel(event: .civilCeremony),
    GridViewModel(event: .mehendi),
    GridViewModel(event: .haldi),
    GridViewModel(event: .hinduCeremony),
    GridViewModel(type: .aboutUs),
    GridViewModel(type: .rsvp)]

typealias GridSelectionActionHandler = (GridViewModel) -> Void
struct GridView: View {
    @State var gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
            
            ForEach(sampleGridViewModels.indices, id: \.self) { index  in
                
                NavigationLink(value: sampleGridViewModels[index]) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(sampleGridViewModels[index].gridTileBackground)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 150)
                        //.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.chocolate, lineWidth: 0.5))
                        Text(sampleGridViewModels[index].gridTileName).titleStyle2Light()
                        
                    }
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
