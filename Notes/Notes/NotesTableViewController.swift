//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Joshua Bates on 5/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotesController.sharedController.notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell", forIndexPath: indexPath)
        
        let noteForRow = NotesController.sharedController.notes[indexPath.row]
        
        cell.textLabel?.text = noteForRow.text
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let detailViewController = segue.destinationViewController as? NotesDetailViewController else {fatalError("unexpected destination from segue") }
        if segue.identifier == "viewNote" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                let note = NotesController.sharedController.notes[selectedIndexPath.row]
                detailViewController.note = note
                detailViewController.segueType = .existing
            }
        } else if segue.identifier == "addNote" {
            detailViewController.segueType = .new
        }
    }
    
    

}
