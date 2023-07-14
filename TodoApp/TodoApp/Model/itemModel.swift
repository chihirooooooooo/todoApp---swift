//
//  itemModel.swift
//  TodoApp
//
//  Created by Chihiro Asanoma on 2023/07/13.
//

import Foundation

struct ItemModel : Identifiable, Codable {
    let title : String
    let isCompleted : Bool
    let id : String
    
    init(Id : String = UUID().uuidString, Title: String, IsCompleted : Bool){
        self.id = Id
        self.title = Title
        self.isCompleted = IsCompleted
    }
    
    
    func updateCompleted() -> ItemModel {
        return ItemModel(Id: id, Title: title, IsCompleted: !isCompleted)
    }
}
