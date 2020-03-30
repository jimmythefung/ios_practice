//
//  EditChecklistItemView.swift
//  Svapp
//
//  Created by Jimmy Fung on 2/23/20.
//  Copyright © 2020 Jimmy Fung. All rights reserved.
//

import SwiftUI

struct EditChecklistItemView: View {
    // Properties
    // ===========
    
    @Binding var checklistItem: ChecklistItem
    
    // User interface content and layout
    var body: some View {
        Form {
            TextField("Name", text: $checklistItem.name)
            Toggle("Completed", isOn: $checklistItem.isChecked)
        }
    }
}

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: .constant(ChecklistItem(name: "Sample Item")))
    }
}
