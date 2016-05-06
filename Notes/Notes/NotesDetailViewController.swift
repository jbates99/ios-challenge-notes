//
//  NotesDetailViewController.swift
//  Notes
//
//  Created by Joshua Bates on 5/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

enum SegueType {
    case new
    case existing
}

class NotesDetailViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet var noteTextView: UITextView!
    
    // MARK: Variables
    
    var segueType = SegueType.new
    var note = Note()
    
    // MARK: Actions
    
    @IBAction func saveNote(sender: AnyObject) {
        switch segueType {
        case .new:
            saveEntry(true)
        case .existing:
            saveEntry(false)
        }
    }
    
    // MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTextView.text = note.text
    }
    
    private func saveEntry(add: Bool) {
        guard !noteTextView.text.isEmpty else { return }
        note.text = noteTextView.text
        
        if add == true {
            NotesController.sharedController.addNote(note)
        }
        navigationController?.popViewControllerAnimated(true)
    }

}
