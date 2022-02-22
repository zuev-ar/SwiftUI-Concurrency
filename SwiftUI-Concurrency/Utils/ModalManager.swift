//
//  ModalManager.swift
//  SwiftUI-Concurrency
//
//  Created by Arkasha Zuev on 22.02.2022.
//

import Foundation

class ModalManager: ObservableObject {
    enum ActiveModals {
        case signIn
        case signUp
        case resetPassword
    }
    
    @Published public var showModal: Bool = false
    @Published public var activeModal: ActiveModals = .signIn
}
