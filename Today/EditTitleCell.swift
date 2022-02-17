//
//  EditTitleCell.swift
//  Today

import UIKit

class EditTitleCell: UITableViewCell{
    
    @IBOutlet var editTitleField: UITextField!
    
    func config(title: String){
        editTitleField.text = title
    }
    
    
}
