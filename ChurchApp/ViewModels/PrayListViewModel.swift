//
//  PrayListViewModel.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 19/12/24.
//

////ViewModel for List of items view
///Primary tab
import FirebaseFirestore
import Foundation

class PrayListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private var userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    //// Delete pary list item
    /// - Parameter id: item id to delete
    func delete(id: String) {
      let  db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("pedidos")
            .document(id)
            .delete()
    }
}
