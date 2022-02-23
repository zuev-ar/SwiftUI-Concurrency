//
//  FeaturedCourseList.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 08.02.2022.
//

import SwiftUI

struct FeaturedCourseList: View {
    var featuredCourses: [Course]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                if featuredCourses.count > 0 {
                    ForEach(featuredCourses, id: \.id) { course in
                        NavigationLink(destination: CourseView(course: course)) {
                            FeaturedCourseCard(featuredCourses: course)
                                .frame(width: 252, height: 350)
                        }
                    }
                } else {
                    ForEach(0 ..< 3, id: \.self) { number in
                        FeaturedCourseCard(featuredCourses: coursePreviewData)
                            .frame(width: 252, height: 350)
                            .redacted(reason: .placeholder)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct FeaturedCourseList_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCourseList(featuredCourses: [coursePreviewData])
    }
}
