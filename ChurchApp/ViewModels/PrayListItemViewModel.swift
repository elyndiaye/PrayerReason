//
//  PrayListItemViewModel.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 19/12/24.
//

////ViewModel for Single to do list item view (each row in items list)
///Primary tab
///

import FirebaseAuth
import FirebaseFirestore
import Foundation

class PrayListItemViewModel: ObservableObject {
    init () {}
    
    func toggleIsDone (item: PrayListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        //Altera done no firebase
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("pedidos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
