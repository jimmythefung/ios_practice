//
//  ChecklistItem.swift
//  Svapp
//
//  Created by Jimmy Fung on 2/23/20.
//  Copyright © 2020 Jimmy Fung. All rights reserved.
//

import Foundation

struct ChecklistItem: Identifiable, Codable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
