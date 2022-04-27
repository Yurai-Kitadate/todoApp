//
//  DataController.swift
//  todoApp
//
//  Created by yurai on 2022/04/25.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Model")
    init() {
            container.loadPersistentStores { description, error in
                if let error = error {
                    print("Core Data failed to load: \(error.localizedDescription)")
                }
           }
       }
    }
