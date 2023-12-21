//
//  HomeView.swift
//  JoinMeOnMyBigDay
//
//  Created by Sharma, Nitish (GT RET Consumer Serv EL- Delivery L, Group Transformation) on 20/11/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeScreenViewModel = HomeScreenViewModel(user: User.dummy)
    
    
    private var headerView: some View {
        VStack {
            Image.homePage
                .frame(height: 600)
                .cornerRadius(30)
                .shadow(color: .chocolate, radius: 2)
            VStack {
                    Text("Neha & Nitish")
                        .titleStyle2Light()
                }
        }
    }
    
    var body: some View {
        ScrollView {
            headerView
            Spacer()
            VStack {
                Text(viewModel.detailText).bodyStyle()
                    .padding(20)
                GridView().padding(.bottom,40)
            }
        }.ignoresSafeArea(.all)
            .background(Color.cream)
        }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeScreenViewModel(user: .dummy))
    }
}
