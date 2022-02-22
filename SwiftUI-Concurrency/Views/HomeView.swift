//
//  HomeView.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 08.02.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    DateTitle(title: "Lear \(courseViewModel.featuredSubject)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                    
                    FeaturedCourseList(featuredCourses: courseViewModel.featuredCourses)
                        .padding(.top, 20)
                    
                    Text("All courses")
                        .fontWeight(.bold)
                        .padding(.horizontal, 20)
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 40)
                    
                    CourseList(courses: courseViewModel.courses)
                        .padding(.top, 20)
                }
            }
            
            Color(.white)
                .animation(.easeIn)
                .frame(height: 0)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CourseViewModel())
    }
}