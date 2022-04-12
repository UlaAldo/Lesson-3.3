//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 01.11.2021.
//

import Combine
import SwiftUI

final class UserManager: ObservableObject {
    
    @Published var user = User()
    
    @AppStorage("user") var isRegistered = false
    @AppStorage("user") var name = ""
   
    func save() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(user) {
            UserDefaults.standard.set(data, forKey: "userData")
        }
    }
}

struct User: Codable {
    var isRegistered = false
    var name = ""
}


