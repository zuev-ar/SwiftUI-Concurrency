//
//  DataTitle.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 08.02.2022.
//

import SwiftUI

struct DateTitle: View {
    @State private var date: String = ""
    
    var title: AttributedString
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(date.uppercased())
                .font(.footnote)
                .fontWeight(.medium)
                .opacity(0.7)
            
            Text(title)
                .font(.title).bold()
        }
        .onAppear {
            date = Date.now.formatted(.dateTime.weekday(.wide).month().day())
        }
    }
}

struct DataTitle_Previews: PreviewProvider {
    static var attributedString: AttributedString {
        var subject = AttributedString("SwiftUI")
        var container = AttributeContainer()
        container.foregroundColor = .purple
        subject.mergeAttributes(container)
        return "Learn " + subject
    }
    
    static var previews: some View {
        DateTitle(title: attributedString)
    }
}
