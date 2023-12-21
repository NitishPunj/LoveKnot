//
//  HomeView.swift
//  JoinMeOnMyBigDay
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 20/11/2023.
//

import SwiftUI

enum WeddingEvents: CaseIterable {
    case civilCeremony
    case haldi
    case mehendi
    case hinduCeremony
}


struct User {
    let name: String
    let accessToEvents: [WeddingEvents]
}

extension User {
   static var dummy: User {
        User(name: "", accessToEvents: WeddingEvents.allCases)
    }
}

final class HomeScreenViewModel: ObservableObject {
    
    @Published private(set) var title = ""
    private var user: User!
    
    init(user: User) {
        self.user = user
        self.title = "Hi \(user.name)"
    }
}

struct HomeView: View {
    @ObservedObject var viewModel: HomeScreenViewModel = HomeScreenViewModel(user: User.dummy)
    
    var body: some View {
        ScrollView {
            Image.homePage.frame(height: 600)
            VStack {
                    Text("Neha & Nitish")
                        .titleStyle()
                    Image("couple image")
                    
                        .resizable()
                        .imageScale(.large)
                }
                
        }.ignoresSafeArea()
        }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeScreenViewModel(user: .dummy))
    }
}
