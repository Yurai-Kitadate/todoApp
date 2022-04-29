//
//  ContentView.swift
//  Shared
//
//  Created by yurai on 2022/04/25.
//

import SwiftUI
struct ContentView: View {
    func deleteTasks(offsets: IndexSet) {
        for index in offsets {
            moc.delete(todos[index])
        }
        try? moc.save()
    }
    @State private var title = ""
    @State private var about = ""
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var todos: FetchedResults<Todos>
    var body: some View {
        VStack {
            NavigationView {
                List{
                    ForEach(todos, id: \.self) { todo in
                        
                        NavigationLink(destination: EachTodoDetailView(updatedAt:todo.updatedAt!,title:todo.title!,about:todo.about!)
                        ){
                            ListTodoView( updatedAt:todo.updatedAt!,
                                          title:todo.title!
                            )
                        }.swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                deleteTasks(offsets: IndexSet(integer: 0))
                            } label: {
                                Image(systemName: "trash.fill")
                            }
                        }
                    }
                }
            }.navigationTitle("Top View")
            
            TextField("タイトル", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("内容", text: $about)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Add") {
                let todo = Todos(context: moc)
                todo.title = title
                todo.about = about
                todo.updatedAt = getNowClockString()
                title = ""
                about = ""
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
func getNowClockString() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
    let now = Date()
    return formatter.string(from: now)
}


