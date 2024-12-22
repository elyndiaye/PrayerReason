//
//  ChurchAppApp.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 16/12/24.
//
import FirebaseCore
import SwiftUI

@main
struct ChurchAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
