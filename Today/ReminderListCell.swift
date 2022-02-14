//
//  ReminderListCell.swift
//  Today

import UIKit

class ReminderListCell: UITableViewCell {
    
    typealias DoneBtnAction = () -> Void
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var circleBtn: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    private var doneBtnAction: DoneBtnAction?
    
    func configure(title: String, date: String, isComplete: Bool, doneAction: @escaping DoneBtnAction){
        titleLabel.text = title
        dateLabel.text = date

        // use style: default in xcode.
        circleBtn.setBackgroundImage(UIImage(systemName:isComplete ?"circle.fill": "circle" ), for: .normal)
        doneBtnAction = doneAction
    }
    
    @IBAction func doneBtnPressed(_ sender: UIButton) {
        doneBtnAction?()
    }
    
}
