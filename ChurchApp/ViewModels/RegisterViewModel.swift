//
//  RegisterViewModel.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 19/12/24.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    func register () {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){
            [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        //Cria o usuario
        let newUser = User(id: id, name: name, email: email, joned: Date().timeIntervalSince1970)
        
        //Adiciona o ususario no db do firebase
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}

