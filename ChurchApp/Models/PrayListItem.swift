//
//  ToDoItem.swift
//  ChurchApp
//
//  Created by Ely Assumpcao Ndiaye on 16/12/24.
//

import Foundation

struct PrayListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
