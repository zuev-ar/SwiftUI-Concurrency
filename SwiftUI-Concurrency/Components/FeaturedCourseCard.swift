//
//  FeaturedCourseCard.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 08.02.2022.
//

import SwiftUI

struct FeaturedCourseCard: View {
    var featuredCourses: Course
    
    var body: some View {
        AsyncImage(url: URL(string: featuredCourses.illustration)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 220, alignment: .center)
        } placeholder: {
            Rectangle()
                .foregroundColor(.gray.opacity(0.2))
        }
        
        VStack(spacing: 8) {
            Text(featuredCourses.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
            
            Text("\(featuredCourses.numberOfSections) sections - \(featuredCourses.numberOfHours) hours")
                .font(.footnote)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
            
            Text(featuredCourses.subtitle)
                .font(.footnote)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)))
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
            
        }
        .padding(16)
        .frame(width: 252, height: 350, alignment: .top)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.init(hex: featuredCourses.colors.first!!), Color.init(hex: featuredCourses.colors.last!!)]), startPoint: .top, endPoint: .bottomLeading)
        )
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                    .blendMode(.overlay))
    }
}

struct FeaturedCourseCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCourseCard(featuredCourses: coursePreviewData)
    }
}
