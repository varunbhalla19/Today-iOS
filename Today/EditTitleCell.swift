//
//  EditTitleCell.swift
//  Today

import UIKit

class EditTitleCell: UITableViewCell{
    
    @IBOutlet var editTitleField: UITextField!
    
    typealias ChangeTitleAction = (String) -> ()
    private var changeTitle: ChangeTitleAction?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        editTitleField.delegate = self
    }
    
    func config(title: String, changeTitleAction: @escaping ChangeTitleAction){
        editTitleField.text = title
        self.changeTitle = changeTitleAction
    }
    
    
}

extension EditTitleCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let editText = editTitleField.text {
            let newTitle = (editText as NSString).replacingCharacters(in: range, with: string)
            changeTitle?(newTitle)
        }
        return true
    }
    
    
}
