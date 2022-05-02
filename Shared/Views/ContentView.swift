import SwiftUI
import CoreData
struct ContentView: View {
    func deleteTodos(offsets: IndexSet) {
        for index in offsets {
            moc.delete(todos[index])
        }
        try? moc.save()
    }
    @State private var title = ""
    @State private var about = ""
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todos.updatedAt!, ascending: true)],
        predicate: nil
    )  var todos: FetchedResults<Todos>
    var body: some View {
        VStack {
            NavigationView {
                List{
                    ForEach(todos) { todo in
                        
                        NavigationLink(destination: EachTodoDetailView(updatedAt:todo.updatedAt!,title:todo.title!,about:todo.about!)
                        ){
                            ListTodoView( updatedAt:todo.updatedAt!,
                                          title:todo.title!
                            )
                        }.navigationBarTitle(Text("Todos"), displayMode: .inline)
                        
                        
                    }.onDelete(perform: deleteTodos)
                }.toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AddTodoView()) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
func getNowTimeAsString() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY年M月d日(EEEEE) H時m分"
    let now = Date()
    return formatter.string(from: now)
}

