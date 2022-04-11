//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 01.11.2021.
//

import SwiftUI

struct RegisterView: View {

    @State private var userName = ""
    @EnvironmentObject private var user: UserManager
    
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
            TextField("Enter your name", text: $userName)
                .multilineTextAlignment(.center)
                Text("\(userName.count)")
                    .foregroundColor(userName.count < 3 ? .red : .green)
            } .padding()
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            } .disabled(userName.count < 3)
        }
    }
    
    private func registerUser() {
        if !userName.isEmpty {
            user.name = userName
            user.save()
            user.isRegistered.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
