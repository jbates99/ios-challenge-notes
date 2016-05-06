//
//  Notes.swift
//  Notes
//
//  Created by Joshua Bates on 5/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    private let textKey = "textKey"
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let text = dictionary[textKey] as? String else { return nil }
        
        self.text = text
    }
    
    convenience init() {
        self.init(text: "")
    }
    
    func dictionaryCopy() -> [String : AnyObject] {
        return [textKey : self.text]
    }
    
}

func ==(lhs: Note, rhs: Note) -> Bool {
    return lhs.text == rhs.text
}