//
//  EventDetail.swift
//  LoveKnot
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 21/12/2023.
//

import SwiftUI

struct EventDetail: View {
    var dummyStore: DummyDataStore = DummyDataStore()
    var eventType: WeddingEventType
    private var event: Event {
        dummyStore.eventDetails(for: eventType)
    }
    
    private var FooterView: some View {
        VStack {
            Image("\(event.imageUrl)").resizable()
                .frame(height: 600)
                .shadow(color: .chocolate, radius: 2)
            
        }
    }
    
    private var whenView: some View {
        HStack {
            Text("When: ").headlineStyle()
            VStack {
                Text(event.when)
                .headlineStyle()
                }
        }
    }
    
    private var whereView: some View {
        HStack {
            Text("Where:").headlineStyle()
            VStack {
                Text(event.location)
                .headlineStyle()
                }
        }
    }
    
    private var description: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Detail:").headlineStyle()
            
            Text(event.description)
                .bodyStyle()
        }
    }
    
    private var rsvp: some View {
        VStack {
            Text("RSVP by 20th Jan 2024").headlineStyle()
            Text("Also check out our website")
                .bodyStyle()
        }
    }

    
    
    var body: some View {
        VStack {
            Text(event.name).titleStyle()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    whenView
                    whereView
                    description
                }.padding([.leading, .bottom, .trailing], 20.0)
                FooterView
                rsvp
                Spacer()
            }
        }.background(Color.cream)
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        EventDetail(eventType: .civilCeremony)
    }
}
