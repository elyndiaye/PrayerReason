//
//  HeaderView.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 17/12/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let background: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 26))
                    .foregroundColor(.white)
            }.padding(.top, 80)
        }.frame(width: UIScreen.main.bounds.width * 3, 
                height: 350)
        .offset( y:-150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title",
                   subTitle: "Subtitle",
                   angle: 15,
                   background: .pink )
    }
}
