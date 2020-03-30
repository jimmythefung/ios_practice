//
//  NewChecklistItemView.swift
//  Svapp
//
//  Created by Jimmy Fung on 2/23/20.
//  Copyright © 2020 Jimmy Fung. All rights reserved.
//

import SwiftUI

struct NewChecklistItemView: View {
    @State var newItemName = ""
    @Environment(\.presentationMode) var prentationMode
    var checklist: Checklist
    
    var body: some View {
        VStack {
            Text("Add new item")
            Form {
                TextField("Enter new item name here", text: $newItemName)
                Button(action: {
                    let newChecklistItem = ChecklistItem(name: self.newItemName, isChecked: false)
                    self.checklist.items.append(newChecklistItem)
                    self.checklist.printChecklistContents()
                    self.checklist.saveListItems()
                    self.prentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add new item")
                    }
                }
                .disabled(newItemName.count == 0)
            }
            Text("Swipe down to cancel.")
        }
    }
}

struct NewChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewChecklistItemView(checklist: Checklist())
    }
}
