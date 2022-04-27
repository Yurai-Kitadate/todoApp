//
//  ContentView.swift
//  Shared
//
//  Created by yurai on 2022/04/25.
//

import SwiftUI
private let mockRepos = [
    Content(
        id: 1,
        title: "Test1",
        updatedAt:"2021/12",
        description: "こんにちは"
    ),
    Content(
        id: 2,
        title: "Test2",
        updatedAt:"2021/11",
        description: "hello"
    )
]
struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var todos: FetchedResults<Todos>
    var body: some View {
        VStack {
            List(todos) { repo in
                
                VStack(alignment: .leading) {
                    Text(repo.title!)
                        .font(.caption)
                    Text(repo.title!)
                        .font(.body)
                        .fontWeight(.semibold)
                }
            }
        }
        Button("Add") {
            let title = ["yurai", "hey", "Hermione", "Luna", "Ron"]
            let about = ["Granger", "Lovegood", "Potter", "Weasley"]
            
            let chosenFirstName = title.randomElement()!
            let chosenLastName = about.randomElement()!
            
            let todo = Todos(context: moc)
            todo.title = chosenFirstName
            todo.about = chosenLastName
            
            try? moc.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
