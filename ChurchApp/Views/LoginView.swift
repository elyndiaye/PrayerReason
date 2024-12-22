//
//  LoginView.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 17/12/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "Assembleia Vila Nova",
                           subTitle: "Programação",
                           angle: 15,
                           background: .pink)
                
               
                //Login Form
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    ProfileButton(
                        title: "Entrar",
                        background: .blue)
                    {
                        //  $viewModel.login()
                    }
                    .padding()
                }.offset(y: -50)
                //Create Account
                VStack {
                    Text("Novo por aqui?")
                    NavigationLink("Criar uma conta", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
