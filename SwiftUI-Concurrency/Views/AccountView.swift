//
//  AccountView.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 22.02.2022.
//

import SwiftUI

struct AccountView: View {
    @StateObject var accountVoiewModel = AccountViewModel()
    @State private var user: User?
    
    var body: some View {
        VStack {
            if let user = user {
                ProfileCard(user: user)
                    .padding(.horizontal, 8)
            } else {
                Text("No user")
            }
        }
        .task {
            do {
                user = try await accountVoiewModel.getUser()
            } catch {
                print("Error while fetchind user: \(error)")
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(AccountViewModel())
    }
}
