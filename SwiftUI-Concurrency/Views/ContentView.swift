//
//  ContentView.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 08.02.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Lear now")
                }
            
            SectionsView()
                .tabItem {
                    Image(systemName: "square.stack.3d.down.right.fill")
                    Text("Sections")
                }
        }
        .task { // insted onAppear()
            await courseViewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CourseViewModel())
    }
}
