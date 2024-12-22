//
//  LoginViewModel.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 19/12/24.
//
import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
     
    init() {
        
    }
    
    func login () {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate () -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Favor preencher todos os campos."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Por favor entre com um email valido."
            return false
        }
        
        return true
    }
}
