//
//  CourseViewModel.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 10.02.2022.
//

import Foundation
import Apollo

enum FeaturedSubject: String, CaseIterable {
    case SwiftUI = "SwiftUI"
    case Design = "Design"
}

@MainActor
class CourseViewModel: ObservableObject {
    @Published public private(set) var courses: [Course] = []
    @Published public private(set) var featuredCourses: [Course] = []
    
    var featuredSubject: FeaturedSubject = FeaturedSubject.allCases.randomElement() ?? .SwiftUI
    
    private func queryCourses() async throws -> GraphQLResult<CourseQuery.Data>? {
        return await withCheckedContinuation({ continuation in
            let preferredLanguage = Locale.preferredLanguages[0]
            let locale = preferredLanguage.contains("en") ? "en-US" : "ru-RU"
            Network.shared.apollo.fetch(query: CourseQuery(locale: locale)) { result in
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
            let result = try await queryCourses()
            if let result = result {
                if let courseCollection = result.data?.courseCollection {
//                    DispatchQueue.main.async {
                        self.courses = self.process(data: courseCollection)
//                    }
                    findFeaturedCourses()
                }
            }
        } catch {
            print("Error: \(error)")
        }
    }
    
    private func process(data: CoursesData) -> [Course] {
        let content = CoursesCollection.init(data)
        
        return content.courses
    }
    
    private func findFeaturedCourses() {
        guard courses.count > 0 else { return }
        
//        DispatchQueue.main.async {
            self.featuredCourses = self.courses.filter { course in
                course.subject == self.featuredSubject.rawValue
//            }
        }
    }
}
