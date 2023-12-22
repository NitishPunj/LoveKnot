//
//  File.swift
//  LoveKnot
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 22/12/2023.
//

import Foundation


enum WeddingEventType: String, CaseIterable, Codable {
    case civilCeremony = "Wedding Ceremony"
    case haldi = "Haldi"
    case mehendi = "Mehndi"
    case hinduCeremony = "Hindu Ceremony"
}


struct Event: Decodable, Hashable, Identifiable {
    var id = UUID()
    
    let name: String
    let type: WeddingEventType
    let description: String
    let location: String
    let when: String
    let imageUrl: String
    let faq: [String:String]
}

protocol EventDataStore {
    func fetchEvents()
    func eventDetails(for type: WeddingEventType) -> Event
}


class DummyDataStore: EventDataStore {
    var events: [Event] = []
    
    func fetchEvents() {
        events = [.civilCeremony,.mehendi,.haldi,.hinduCeremony]
    }
    
    func eventDetails(for type: WeddingEventType) -> Event {
        fetchEvents()
        return events.first (where: {$0.type == type })!
    }
}


fileprivate extension Event {
    static var mehendi: Event {
        .init(name: "The Mehndi Function",
              type: .mehendi,
              description: "This will be a fun night of beautiful mehndi art, indian street food, music, and dancing. Mehndi, otherwise known as henna, is a paste associated with positive spirits and good luck which is applied in intricate designs to the bride’s hands and feet. The colour of mehndi on the bride's hands represents the deep love between the to-be-couple. Mehndi artists will be available on the night if you wish to apply.",
              location: "13 Powderham Caufield",
              when: "8th March 2024",
              imageUrl: "Mehndipicture",
              faq: [:])
    }
    
    static var civilCeremony : Event {
        .init(name: "Wedding Ceremony",
              type: .civilCeremony,
              description: "",
              location: "",
              when: "",
              imageUrl: "Stones",
              faq: [:])
    }
    
    static var haldi : Event {
        .init(name: "Haldi",
              type: .haldi,
              description: "",
              location: "",
              when: "",
              imageUrl: "",
              faq: [:])
    }
    static var hinduCeremony : Event {
        .init(name: "Hindu Ceremony",
              type: .hinduCeremony,
              description: "",
              location: "",
              when: "",
              imageUrl: "",
              faq: [:])
    }
}
