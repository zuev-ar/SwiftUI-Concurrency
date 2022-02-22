//
//  SectionModel.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 15.02.2022.
//

import Foundation

typealias SectionsCollectionData = SectionQuery.Data.SectionCollection

struct SectionDataCollection: Decodable {
    let sections: [SectionModel]
    
    init(_ sectionsCollection: SectionsCollectionData?) {
        self.sections = sectionsCollection?.sections.map({ section -> SectionModel in
            SectionModel(section)
        }) ?? []
    }
    
    struct SectionModel: Decodable {
        let id: String
        let title: String
        var isPinned: Bool
        
        init(_ section: SectionQuery.Data.SectionCollection.Section?) {
            self.id = section?.sys.id ?? ""
            self.title = section?.title ?? ""
            self.isPinned = false
        }
    }
}
