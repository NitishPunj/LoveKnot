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
        User(name: "Sharma", accessToEvents: WeddingEvents.allCases)
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
            VStack {
                HStack (alignment: .center, spacing: 0) {
                                Text(viewModel.title)
                                    .headlineStyle()
                                Image(systemName: "heart.fill")
                                               .symbolRenderingMode(.palette)
                                               .foregroundStyle(Color.pink, Color.green)
                            }
                Spacer()
                Text("Welcome to our wedding website")
                    .bodyStyle()
                Image("couple image")
                    .resizable()
                    .imageScale(.large)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeScreenViewModel(user: .dummy))
    }
}