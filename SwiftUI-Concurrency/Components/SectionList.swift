//
//  SectionList.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 15.02.2022.
//

import SwiftUI

struct SectionList: View {
    @EnvironmentObject var sectionViewModel: SectionViewModel
    
    var body: some View {
        List {
            ForEach($sectionViewModel.sections, id: \.id) { $section in
                HStack {
                    Text(section.title)
                    Spacer()
                    
                    if section.isPinned {
                        Image(systemName: "pin.fill")
                            .foregroundColor(.yellow)
                    }
                }
                .swipeActions {
                    Button {
                        section.isPinned.toggle()
                        sectionViewModel.ordersectionsByPinned()
                    } label: {
                        if section.isPinned {
                            Label("Unpin", systemImage: "pin.slash")
                        } else {
                            Label("Pin", systemImage: "pin")
                        }
                    }
                }
                .tint(.yellow)
            }
        }
        .task {
            await sectionViewModel.fetch()
        }
        .refreshable {
            await sectionViewModel.randomizeSections()
        }
    }
}

struct SectionList_Previews: PreviewProvider {
    static var previews: some View {
        SectionList()
            .environmentObject(SectionViewModel())
    }
}
