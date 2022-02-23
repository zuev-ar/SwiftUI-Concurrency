//
//  ContentView.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 08.02.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    @EnvironmentObject var sectionViewModel: SectionViewModel
    @StateObject var modalManager = ModalManager()
    
    @State private var text = ""
    
    var body: some View {
        ZStack {
            TabView {
                NavigationView {
                    HomeView()
                        .environmentObject(modalManager)
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Lear now")
                }
                
                NavigationView {
                    SectionsView()
                }
                .searchable(text: $text) {
                    ForEach(sectionViewModel.sections.prefix(3)) { section in
                        Text(section.title)
                            .searchCompletion(section.title)
                    }
                }
                .onSubmit(of: .search) {
                    sectionViewModel.filterSections(for: text)
                }
                .tabItem {
                    Image(systemName: "square.stack.3d.down.right.fill")
                    Text("Sections")
                }
                
                AccountView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Account")
                    }
            }
            .task { // insted onAppear()
                await courseViewModel.fetch()
            }
            
            if modalManager.showModal {
                ModalManagerView()
                    .environmentObject(modalManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CourseViewModel())
            .environmentObject(SectionViewModel())
    }
}
