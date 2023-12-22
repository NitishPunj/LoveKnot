//
//  HomeScreenViewModel.swift
//  LoveKnot
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 21/12/2023.
//

import Foundation

struct User {
    let name: String
    let accessToEvents: [WeddingEventType]
}

extension User {
   static var dummy: User {
        User(name: "", accessToEvents: WeddingEventType.allCases)
    }
}

final class HomeScreenViewModel: ObservableObject {
    
    @Published private(set) var title = ""
    private var user: User!
    var detailText = """
We met three years ago and falling in love with each other was so easy, it's like a fairytale.

In our amazing journey we traveled to so many incredible places together!
From Europe to America, Thailand to Australia, and lastly and most importantly India.
Our  beautiful journey is filled with adventure and love especially our Lapland trip! 🎉💍

We welcome you to join us celebrating our special day and share wonderful memories with us.
"""
    
    init(user: User) {
        self.user = user
        self.title = "Hi \(user.name)"
    }
}
