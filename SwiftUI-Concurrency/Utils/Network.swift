//
//  Network.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 10.02.2022.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.contentful.com/content/v1/spaces/ao8zu3frolst?access_token=fYm6xc281jEDh0a58ATEM4Zv4zJfIYda2Ikg74MMoFw")!)
}
