//
//  EditDateCell.swift
//  Today

import UIKit

class EditDateCell: UITableViewCell{
    
    typealias DateChangeAction = (Date) -> ()

    
    @IBOutlet var dateField: UIDatePicker!
    
    private var dateChangeActionn: DateChangeAction?
    
    func config(date: Date, changeDate: @escaping DateChangeAction){
        dateField.date = date
        self.dateChangeActionn = changeDate
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateField.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        self.dateChangeActionn?(sender.date)
    }
    
}
