//
//  EditNoteCell.swift
//  Today

import UIKit

class EditNotesCell: UITableViewCell {
    
    @IBOutlet var noteCell: UITextView!
    
    func config(note: String?){
        noteCell.text = note
    }
    
}
