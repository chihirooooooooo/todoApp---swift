//
//  ListViewModel.swift
//  TodoApp
//
//  Created by Chihiro Asanoma on 2023/07/13.
//

import Foundation

class ListViewModel : ObservableObject {
    
    @Published var items : [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey : String = "items_List"
    
    init(){
        getItems()
    }
    
    func addItem(title: String){
        let newItem = ItemModel(Title: title, IsCompleted: false)
        items.append(newItem)
    }
    
    func update(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompleted()
            
        }
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func getItems(){
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else {
            return
        }
        guard let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {
            return
        }
        
       
        self.items = saveItems
    }
    
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
        
//        guard let encodedData = try? JSONEncoder().encode(items) else {
//            return
//        }
//        UserDefaults.standard.set(encodedData, forKey: itemsKey)

        
    }
    
}
