//
//  ReminderListCell.swift
//  Today

import UIKit

class ReminderListCell: UITableViewCell {
    
    typealias DoneBtnAction = () -> Void
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var circleBtn: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    var doneBtnAction: DoneBtnAction?
    
    @IBAction func doneBtnPressed(_ sender: UIButton) {
        doneBtnAction?()
    }
    
}
