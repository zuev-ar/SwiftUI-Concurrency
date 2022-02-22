//
//  AccountViewModel.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 22.02.2022.
//

import Foundation

class AccountViewModel: ObservableObject {
    
    func getUser() async throws -> User {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/1") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)? .statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedUser = try JSONDecoder().decode(User.self, from: data)
        
        return decodedUser
    }
    
    private func getUserOld() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/1") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUser = try JSONDecoder().decode(User.self, from: data)
                        print("decodedUser", decodedUser)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
}
