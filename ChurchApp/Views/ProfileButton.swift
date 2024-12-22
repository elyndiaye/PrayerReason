//
//  ProfileButton.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 18/12/24.
//

import SwiftUI

struct ProfileButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                
            }
        }
    }
}

struct ProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButton(title:"Value",
                      background: .pink,
                      action: {})
    }
}
