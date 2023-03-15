//
//  ContentView.swift
//  qlick
//
//  Created by Brian Mwangi on 29/06/2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
           
                switch selectedTab {
                case .home:
                   HomeView()
                case .explore:
                    AccountView()
                case .notifications:
                    AccountView()
                case .library:
                    AccountView()
                }
           
            
            TabBar()
                .offset(y: model.showDetail ? 200 : 0)
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
            ContentView()
                .preferredColorScheme(.light)
                .previewDevice("iPhone 12")
        }
        .environmentObject(Model())
    }
}
