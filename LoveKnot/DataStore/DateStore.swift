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
    let time: String
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
              description: "Fun and colourful Indian clothing. No stiletto heels please.",
              location: "13 Powderham Road, Caulfield North VIC 3161, Australia",
              when: "Friday, March 8 2024",
              time: "From 6pm",
              imageUrl: "Mehndipicture",
              faq: [:])
    }
    
    static var civilCeremony : Event {
        .init(name: "Wedding Ceremony",
              type: .civilCeremony,
              description: "",
              location: "",
              when: "",
              time: "",
              imageUrl: "Stones",
              faq: [:])
    }
    
    static var haldi : Event {
        .init(name: "Haldi",
              type: .haldi,
              description: "",
              location: "13 Powderham Road, Caulfield North VIC 3161, Australia",
              when: "",
              time: "",
              imageUrl: "",
              faq: [:])
    }
    static var hinduCeremony : Event {
        .init(name: "Hindu Ceremony",
              type: .hinduCeremony,
              description: "",
              location: "",
              when: "",
              time: "",
              imageUrl: "",
              faq: [:])
    }
}
