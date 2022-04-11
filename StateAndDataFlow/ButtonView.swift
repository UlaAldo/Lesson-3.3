//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Юлия Алдохина on 09/04/22.
//

import SwiftUI

struct ButtonView: View {
    let action: () -> Void
    let title: String
    let color: Color
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(action: {}, title: "START", color: .red)
    }
}
