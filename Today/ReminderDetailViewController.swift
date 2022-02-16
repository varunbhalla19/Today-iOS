//
//  ReminderDetailViewController.swift
//  Today

import UIKit

class ReminderDetailViewController: UITableViewController {
    
    private var reminder: Task?
    private var dataSource: ReminderDetailViewDataSource?
    
    func configure(with reminder: Task){
        self.reminder = reminder
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let task = reminder {
            self.dataSource = ReminderDetailViewDataSource(task: task)            
            tableView.dataSource = self.dataSource
        }else {
            fatalError("Some ERror occurred!")
        }
    }
}

extension ReminderDetailViewController {
    
}
