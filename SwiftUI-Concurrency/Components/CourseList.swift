//
//  CourseList.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 08.02.2022.
//

import SwiftUI

struct CourseList: View {
    var courses: [Course]
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 15)]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            if courses.count > 0 {
                ForEach(courses, id: \.id) { course in
                    NavigationLink(destination: CourseView(course: course)) {
                        CourseCard(course: course)
                    }
                }
            } else {
                ForEach(0 ..< 4, id: \.self) { number in
                    CourseCard(course: coursePreviewData)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList(courses: [coursePreviewData])
    }
}
