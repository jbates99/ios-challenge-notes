//
//  Notes.swift
//  Notes
//
//  Created by Joshua Bates on 5/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class note: Equatable {
    
    private let textKey = "textKey"
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let text = dictionary[textKey] as? String else { return nil }
    }
    
    convenience init() {
        self.init(text: "")
    }
    
    func dictionaryCopy() -> [String : AnyObject] {
        return [textKey : self.text]
    }
    
}

func ==(lhs: note, rhs: note) -> Bool {
    return lhs.text == rhs.text
}