//
//  PrayListView.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 19/12/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct PrayListView: View {
    @StateObject var viewModel: PrayListViewModel
    @FirestoreQuery var items: [PrayListItem]
    
    
    init(userId: String) {
        //por convercao qnd é var com marcacao @ usar o _ na frente
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/pedidos")
        self._viewModel = StateObject(wrappedValue: PrayListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    PrayListItemView(item: item)
                        .swipeActions {
                            Button("Remover") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                            
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Pedidos de oração")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct PrayListView_Previews: PreviewProvider {
    static var previews: some View {
        PrayListView(userId: "5t8BZyQkOFT7r2QYxz9bQ8FRP5o1")
    }
}
