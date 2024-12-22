//
//  PrayListItemView.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 19/12/24.
//

import SwiftUI

struct PrayListItemView: View {
    @StateObject var viewModel = PrayListItemViewModel()
    let item: PrayListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill": "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct PrayListItemView_Previews: PreviewProvider {
    static var previews: some View {
        PrayListItemView(item: .init(id: "123",
                                     title: "Cura",
                                     dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false))
    }
}
