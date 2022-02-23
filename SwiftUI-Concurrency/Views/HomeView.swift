//
//  HomeView.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 08.02.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    @EnvironmentObject var modalManager: ModalManager
    
    var attributedString: AttributedString {
        var subject = AttributedString(courseViewModel.featuredSubject.rawValue)
        var container = AttributeContainer()
        if courseViewModel.featuredCourses.count > 0 {
            let color = Color.init(hex: courseViewModel.featuredCourses[0].colors[0]!)
            container.foregroundColor = color
        } else {
            container.foregroundColor = .purple
        }
        subject.mergeAttributes(container)
        return "Learn " + subject
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        DateTitle(title: attributedString)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 20)
                            .padding(.horizontal, 20)
                        
                        Spacer()
                        
                        ProfileIcon()
                            .onTapGesture {
                                modalManager.showModal.toggle()
                            }
                    }
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
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CourseViewModel())
            .environmentObject(ModalManager())
    }
}
