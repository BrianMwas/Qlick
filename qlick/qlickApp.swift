//
//  qlickApp.swift
//  qlick
//
//  Created by Brian Mwangi on 29/06/2022.
//

import SwiftUI

@main
struct qlickApp: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
