//
//  SectionsView.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 15.02.2022.
//

import SwiftUI

struct SectionsView: View {
    var body: some View {
        VStack {
            Text("All Sections")
                .font(.largeTitle).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            SectionList()
        }
    }
}

struct SectionsView_Previews: PreviewProvider {
    static var previews: some View {
        SectionsView()
    }
}
