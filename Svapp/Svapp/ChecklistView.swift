//
//  ChecklistView.swift
//  Svapp
//
//  Created by Jimmy Fung on 2/12/20.
//  Copyright © 2020 Jimmy Fung. All rights reserved.
//

import SwiftUI

struct ChecklistView: View {
    
    // Properties
    // ==========
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    // User interface content and layout
    var body: some View {
        NavigationView{
            List{
                ForEach(checklist.items) { index in
                    RowView(checklistItem: self.$checklist.items[index])
                    /*
                    HStack{
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✅" : "🔲")
                    }
                    .background(Color.white)
                    .onTapGesture {
                        print("tapped: \(checklistItem.name).")
                        if let matchingIndex = self.checklist.items.firstIndex(where: {$0.id == checklistItem.id}){
                            self.checklist.items[matchingIndex].isChecked.toggle()
                        }
                        self.checklist.printChecklistContents()
                    }
                    */
                }
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }
            .navigationBarItems(
                leading: Button(action: {self.newChecklistItemViewIsVisible = true}){
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add")
                    }
                },
                trailing: EditButton()
            )
            .navigationBarTitle("Checklist", displayMode: .inline)
            .onAppear(){
                self.checklist.printChecklistContents()
                self.checklist.saveListItems()
            }
        }
        .sheet(isPresented: $newChecklistItemViewIsVisible){
            NewChecklistItemView(checklist: self.checklist)
        }
    }

}
        

// Preview
// ==========

struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
