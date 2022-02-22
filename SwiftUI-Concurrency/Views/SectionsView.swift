//
//  SectionsView.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 15.02.2022.
//

import SwiftUI

struct SectionsView: View {
    @EnvironmentObject var sectionViewModel: SectionViewModel
    @Environment(\.isSearching) var isSearching
    
    var body: some View {
        VStack {
            if isSearching {
                if sectionViewModel.filteredSections.count > 0 {
                    List(sectionViewModel.filteredSections) { section in
                        Text(section.title)
                    }
                } else {
                    List(0 ..< 1) { section in
                        Text("No results")
                    }
                }
            } else {
                SectionList()
            }
        }
        .navigationTitle(Text("All Sections"))
    }
}

struct SectionsView_Previews: PreviewProvider {
    static var previews: some View {
        SectionsView()
            .environmentObject(SectionViewModel())
    }
}
