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
            //Text("When: ").headlineStyle()
            VStack (alignment: .leading, spacing: 10){
                Text(event.when)
                .headlineStyle()
                Text(event.time)
                .subHeadlineStyle()
                }
        }
    }
    
    private var whereView: some View {
        HStack {
            //Text("Where:").headlineStyle()
            VStack(alignment: .leading, spacing: 10) {
                description
                Text(event.location)
                .bodyStyle()
                }
        }
    }
    
    private var description: some View {
        VStack(alignment: .leading, spacing: 10) {
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
            Text(event.name)
                .font(.title2)
                .foregroundColor(.cream)
                .fontDesign(.serif)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            Spacer()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    whenView
                    whereView
                }.padding([.leading, .bottom, .trailing], 10)
                FooterView
                rsvp
                Spacer()
            }.background(Color.cream)
        }.background(Color.mehndiGreen)
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        EventDetail(eventType: .mehendi)
    }
}
