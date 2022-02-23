//
//  SectionView.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 23.02.2022.
//

import SwiftUI

struct SectionView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var course: Course
    var section: SectionCollection.Section
    
    var body: some View {
        ZStack(alignment: .top) {
            content
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    CloseButton()
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 16)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
        }
        .navigationBarHidden(true)
    }
    
    var content: some View {
        ScrollView {
            SectionViewCover(course: course, section: section)
            
            Text(section.content)
                .padding(16)
                .padding(.bottom, 100)
        }
        .ignoresSafeArea()
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(course: coursePreviewData, section: (coursePreviewData.sectionCollection?.sections[0])!)
    }
}
