//
//  NotesController.swift
//  Notes
//
//  Created by Joshua Bates on 5/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NotesController {
    
    static let sharedController = NotesController()
    
    private let notesKey = "notes"
    
    var notes = [Note]()
    
    init() {
        self.notes = []
        self.loadFromPersistentStorage()
    }
    
    func addNote(note: Note) {
        notes.append(note)
        saveToPersistentStorage()
    }
    
    func removeNote(note: Note) {
        if let noteIndex = notes.indexOf(note) {
            notes.removeAtIndex(noteIndex)
        }
    }
    
    func loadFromPersistentStorage() {
        let noteDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(notesKey) as? [[String: AnyObject]]
        if let noteDictionaries = noteDictionariesFromDefaults {
            self.notes = noteDictionaries.map ( { Note(dictionary: $0)! } )
        }
    }
    
    func saveToPersistentStorage() {
        let noteDictionaries = self.notes.map( { $0.dictionaryCopy() } )
        NSUserDefaults.standardUserDefaults().setObject(noteDictionaries, forKey: notesKey)
    }
}