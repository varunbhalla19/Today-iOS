//
//  EditDateCell.swift
//  Today

import UIKit

class EditDateCell: UITableViewCell{
    
    @IBOutlet var dateField: UIDatePicker!
    
    func config(date: Date){
        dateField.date = date
    }
    
    
}
