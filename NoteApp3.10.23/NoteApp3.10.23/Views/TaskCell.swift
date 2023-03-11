//
//  TaskCell.swift
//  NoteApp3.10.23
//
//  Created by Consultant on 3/10/23.
//

import SwiftUI

struct TaskCell: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var passedTaskItem: TaskItem
    
    var body: some View {
        CheckBoxView(passedTaskItem: passedTaskItem).environmentObject(dateHolder)
        
        Text(passedTaskItem.name ?? "")
            .padding(.horizontal)
        
        if !passedTaskItem.isCompleted() && passedTaskItem.scheduleTime{
            Spacer()
            Text(passedTaskItem.dueDateTimeOnly())
                .font(.footnote)
                .foregroundColor(passedTaskItem.overDueColor())
                .padding(.horizontal)
        }
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(passedTaskItem: TaskItem())
    }
}
