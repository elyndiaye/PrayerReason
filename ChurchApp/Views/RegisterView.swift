//
//  RegisterView.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 17/12/24.
//

import SwiftUI

struct RegisterView: View {
  @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Registre-se",
                       subTitle: "Fique por dentro",
                       angle: -15,
                       background: .blue)
            Form {
                TextField("Nome Completo", text: $viewModel.name).textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Digite a sua senha", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                
                ProfileButton(
                    title: "Criar conta",
                    background: .green,
                    action: {
                    //Attempt Login
                        viewModel.register()
                    }).padding()
            }
            .offset(y: -50)
            
            Spacer()
            
           
        }
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
