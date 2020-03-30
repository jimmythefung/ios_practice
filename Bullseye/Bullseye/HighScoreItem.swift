//
//  HighScoreItem.swift
//  Bullseye
//
//  Created by Jimmy Fung on 3/23/20.
//  Copyright © 2020 Jimmy Fung. All rights reserved.
//

import Foundation

class HighScoreItem : NSObject, Codable {
    var name = ""
    var score = 0
    required init(name: String, score: Int){
        self.name = name
        self.score = score
    }
}
