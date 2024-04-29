//
//  ToDoListView.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 4/14/24.
//

/* kudos to Jared Davidson
 https://youtu.be/LQ-S43P1P1Q?si=OMyMxOA6MATcWvx1
 */

import Foundation
import SwiftUI
import Combine

struct ToDoListView: View {

    let offwhiteBG = Color(red: 234/255, green: 231/255, blue: 231/255)

    @ObservedObject var taskStore = TaskStore()
    @State var newToDo : String = ""
    
    var typeBar : some View {
        HStack {
            TextField("Enter a new task", text: self.$newToDo)
                .font(.custom("Jost", size: 20))
                .foregroundColor(.black)
            Button(action: self.addTask, label: {
                Text("Add New")
                    .font(.custom("Jost", size: 20))
            })
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(offwhiteBG).ignoresSafeArea()
                VStack {
                    Text("To Do List")
                        .font(.custom("Jost", size: 40))
                        .foregroundColor(.black)
                    typeBar.padding()
                    List {
                        ForEach(self.taskStore.tasks) { task in
                            Text(task.toDoItem)
                        }.onMove(perform: self.move)
                            .onDelete(perform: self.deleteTask)
                    }
                    .navigationBarItems(trailing: EditButton())
                    .font(.custom("Jost", size: 20))
                }
            }
        }
    }


    /// FUNCTIONS


    // add new task
    func addTask() {
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDoItem: newToDo))
        self.newToDo = ""
        //Add auto generated id in the future.
    }

    // moves tasks around - user can order as they please
    func move(from source : IndexSet, to destination : Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }

    // delete tasks
    func deleteTask(at offsets : IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
    
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
