//
//  SectionViewModel.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 15.02.2022.
//

import Foundation
import Apollo

class SectionViewModel: ObservableObject {
    @Published public var sections: [SectionDataCollection.SectionModel] = []
    
    private func querySections() async throws -> GraphQLResult<SectionQuery.Data>? {
        return await withCheckedContinuation({ continuation in
            Network.shared.apollo.fetch(query: SectionQuery()) { result in
                switch result {
                case .success(let graphQLResult):
                    continuation.resume(returning: graphQLResult)
                case .failure(let error):
                    if let error = error as? Never {
                        continuation.resume(throwing: error)
                    }
                }
            }
        })
    }
    
    func fetch() async {
        do {
            let result = try await querySections()
            if let result = result {
                if let sectionCollection = result.data?.sectionCollection {
                    DispatchQueue.main.async {
                        self.sections = self.process(data: sectionCollection)
                    }
                }
            }
        } catch {
            print("Error: \(error)")
        }
    }
    
    private func process(data: SectionsCollectionData) -> [SectionDataCollection.SectionModel] {
        let content = SectionDataCollection.init(data)
        
        return content.sections
    }
    
    func randomizeSections() async {
        sections.shuffle()
    }
    
    func ordersectionsByPinned() {
        sections.sort { $0.isPinned && !$1.isPinned }
    }
}
