//
//  DisplayNoteViewController.swift
//  Makestagram
//
//  Created by Samuel Putnam on 7/11/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import RealmSwift

class DisplayNoteViewController: UIViewController {
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var noteTitleTextField: UITextField!
    var note: Note?
    var post: Post?
    
    @IBOutlet weak var noteContentTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let listNotesTableViewController = segue.destinationViewController as! ListNotesTableViewController
        if let identifier = segue.identifier {
            if identifier == "Cancel" {
                print("Cancel button tapped")
            } else if identifier == "Save" {
                print("Save button tapped")
                if let note = note {
                    let newNote = Note()
                    newNote.title = noteTitleTextField.text ?? ""
                    newNote.content = noteContentTextView.text ?? ""
                    RealmHelper.updateNote(note, newNote: newNote)
                } else {
                    let note = Note()
                    note.title = noteTitleTextField.text ?? ""
                    note.content = noteContentTextView.text ?? ""
                    note.modificationTime = NSDate()
                    RealmHelper.addNote(note)
                }
                listNotesTableViewController.notes = RealmHelper.retrieveNotes()
            }
        }
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if isModal() == true {
            saveButton.hidden = false
            cancelButton.hidden = false
        }
        else {
            saveButton.hidden = true
            cancelButton.hidden = true
        }

            if let note = note {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
            }
            else {noteTitleTextField.text = ""
            noteContentTextView.text = ""
            }
    }
    

    func isModal() -> Bool {
        // this is the opposite of the expected behavior, but it works
        if self.presentingViewController!.presentingViewController == navigationController {
            return true
        }
        return false
    }
    @IBAction func saveButton(sender: AnyObject) {
        let note = Note()
        note.title = noteTitleTextField.text ?? ""
        note.content = noteContentTextView.text ?? ""
        note.modificationTime = NSDate()
        RealmHelper.addNote(note)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancelButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
