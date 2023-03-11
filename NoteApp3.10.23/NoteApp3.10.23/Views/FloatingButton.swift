//
//  FloatingButton.swift
//  NoteApp3.10.23
//
//  Created by Consultant on 3/10/23.
//

import SwiftUI

struct FloatingButton: View {
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        
        Spacer()
        HStack{
            NavigationLink(destination: TaskEditView(passedTaskItem: nil, initialDate: Date())
                .environmentObject(dateHolder)){
             addbutton()
            }
            .shadow(color: .black.opacity(0.5), radius: 3.0, x: 0, y: 0)
      
        }
        
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}


struct addbutton:View {
    var body: some View{
        ZStack{
            Circle()
                .frame(width: 50)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 3)
            
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                
                .foregroundColor(Color(.systemPink))
        }
        .frame(height: 50)
    }
    
}
