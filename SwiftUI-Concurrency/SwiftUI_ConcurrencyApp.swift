//
//  SwiftUI_ConcurrencyApp.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 08.02.2022.
//

import SwiftUI

@main
struct SwiftUI_ConcurrencyApp: App {
    @StateObject var courseViewModel = CourseViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(courseViewModel)
        }
    }
}
