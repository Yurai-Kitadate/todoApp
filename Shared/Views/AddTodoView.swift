//
//  AddTodoView.swift
//  todoApp
//
//  Created by yurai on 2022/05/02.
//

import Foundation
import SwiftUI
import CoreData
struct AddTodoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var title = ""
    @State private var about = ""
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todos.updatedAt!, ascending: false)],
        predicate: nil
    )  var todos: FetchedResults<Todos>
    var body: some View {
        VStack {
            TextField("タイトル", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextEditor(text: $about)
                        .frame(width: 300, height: 200)
                        .border(Color.gray, width: 1)
            Button(action: {
                let todo = Todos(context: moc)
                todo.title = title
                todo.about = about
                todo.updatedAt = getNowTimeAsString()
                title = ""
                about = ""
                try? moc.save()
                self.presentationMode.wrappedValue.dismiss()
                
            }) {
                Text("Add")
            }
        }
        //        .toolbar {
        //            ToolbarItem(placement: .navigationBarTrailing) {
        //                NavigationLink(destination: ContentView()) {
        //                    Image(systemName: "plus")
        //                }
        //            }
        //        }
    }
}
