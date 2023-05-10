//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Eric Burrell on 10/24/22.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
