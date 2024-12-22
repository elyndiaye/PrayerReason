//
//  NewItemView.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 16/12/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    //Vamos usar o biding para apos cadastrar o item a tela desaparecer (apos clicar adicionar
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("Novo motivo de oração")
                .font(.system(size: 30))
                .bold()
                .padding(.top, 100)
            
            Form {
                //Title
                TextField("Pedido de oração", text: $viewModel.title)
                //Due Date
                DatePicker("Data", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Button
                ProfileButton(title: "Adicionar",
                              background: .pink) {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                   
                }
                .padding()
            }
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text("Por favor, preencha todos os campos e selecione a data presente ou superior."))
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView( newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
