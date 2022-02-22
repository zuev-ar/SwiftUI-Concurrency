//
//  AccountView.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 22.02.2022.
//

import SwiftUI

struct AccountView: View {
    @StateObject var accountVoiewModel = AccountViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                accountVoiewModel.getUser()
            }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(AccountViewModel())
    }
}
