//
//  EditNoteCell.swift
//  Today

import UIKit

class EditNotesCell: UITableViewCell {
    
    @IBOutlet var noteCell: UITextView!
    
    typealias EditNotesAction = (String) -> ()
    
    private var editNotes: EditNotesAction?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        noteCell.delegate = self
    }
    
    func config(note: String?, editNotesAction: @escaping EditNotesAction){
        noteCell.text = note
        self.editNotes = editNotesAction
    }
    
}

extension EditNotesCell: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if let note = noteCell.text {
            let originalNote = (note as NSString).replacingCharacters(in: range, with: text)
            editNotes?(originalNote)
        }
        return true
    }
}
