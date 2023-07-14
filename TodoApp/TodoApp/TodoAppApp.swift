//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Chihiro Asanoma on 2023/07/13.
//

import SwiftUI

@main
struct TodoAppApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
