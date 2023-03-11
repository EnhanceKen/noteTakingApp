//
//  DateScroller.swift
//  NoteApp3.10.23
//
//  Created by Consultant on 3/11/23.
//

import SwiftUI

struct DateScroller: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        HStack{
            Spacer()
            Button(action: moveBack){
                Image(systemName: "arrowshape.left.fill")
                    .imageScale(.large)
                    .font(Font.title)
                    .foregroundColor(.white)
            }
            
            Text(dateFormatted())
                .font(.title)
                .bold()
                .animation(.none)
                .frame(maxWidth: .infinity)
            
            Button(action: moveForward){
                Image(systemName: "arrowshape.right.fill")
                    .imageScale(.large)
                    .font(Font.title)
                    .foregroundColor(.white)
            }
        }
    }
    
    
    
    func dateFormatted() -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd LLL yy"
        
        return dateFormatter.string(from: dateHolder.date)
        
    }
    
    func moveBack(){
        withAnimation{
            dateHolder.MoveDate(-1, viewContext)
        }
    }
    
    
    func moveForward(){
        withAnimation{
            dateHolder.MoveDate(1, viewContext)
        }
    }
}

struct DateScroller_Previews: PreviewProvider {
    static var previews: some View {
        DateScroller()
    }
}
