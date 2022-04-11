//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 01.11.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 50)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(EdgeInsets(top: 100, leading: 20, bottom: 100, trailing: 20))
            ButtonView(action: {timer.startTimer()},
                       title: timer.buttonTitle,
                       color: .red
            )
            Spacer()
            ButtonView(action: { logOut() },
                       title: "LogOut",
                       color: .blue
            )
        } .padding()
        
    }
    
    private func logOut(){
        userManager.isRegistered.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
