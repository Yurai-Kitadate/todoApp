//
//  todoAppApp.swift
//  Shared
//
//  Created by yurai on 2022/04/25.
//

import SwiftUI
@main
struct todoApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
