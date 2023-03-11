//
//  ContentView.swift
//  NoteApp3.10.23
//
//  Created by Consultant on 3/10/23.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<TaskItem>
    
    var body: some View {
        NavigationView {
            VStack{
                DateScroller()
                    .padding()
                    .environmentObject(dateHolder)
                HStack{
                    Text("To Do List")
                        .font(.title)
                    FloatingButton().environmentObject(dateHolder)
                }.padding(10)
                
                    List {
                        ForEach(dateHolder.taskItems) { taskItem in
                            NavigationLink(destination: TaskEditView(passedTaskItem: taskItem, initialDate: Date())
                                .environmentObject(dateHolder)){
                                TaskCell(passedTaskItem: taskItem)
                                        .environmentObject(dateHolder)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }

                
            }
            .frame(width: 350, height: 400)
            .background(Color(.systemPink))
            .cornerRadius(30)
            .shadow(color: .black, radius: 3, x: 0, y: 0)
        }
    }

    
    func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { dateHolder.taskItems[$0] }.forEach(viewContext.delete)

            dateHolder.saveContext(viewContext)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
