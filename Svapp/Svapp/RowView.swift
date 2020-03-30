//
//  RowView.swift
//  Svapp
//
//  Created by Jimmy Fung on 2/25/20.
//  Copyright © 2020 Jimmy Fung. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(checklistItem: $checklistItem)){
            HStack {
                Text(checklistItem.name)
                Spacer()
                Text(checklistItem.isChecked ? "✅" : "🔲")
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
