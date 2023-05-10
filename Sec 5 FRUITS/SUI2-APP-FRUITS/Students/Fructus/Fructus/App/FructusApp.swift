//
//  FructusApp.swift
//  Fructus
//
//  Created by Eric Burrell on 9/28/22.
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    init() {
        isOnboarding = true
    }
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
            
        }
    }
}
