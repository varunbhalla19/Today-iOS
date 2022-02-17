//
//  ReminderDetailViewController.swift
//  Today

import UIKit

class ReminderDetailViewController: UITableViewController {
    
    private var reminder: Task?
    private var dataSource: UITableViewDataSource?
    
    func configure(with reminder: Task){
        self.reminder = reminder
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setEditing(false, animated: false)
        navigationItem.setRightBarButton(editButtonItem, animated: true)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: ReminderDetailEditDataSource.dateLabelCellIdentifier)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        guard let task = reminder else {
            fatalError("Some ERror occurred!")
        }
        
        if editing {
            self.dataSource = ReminderDetailEditDataSource(reminder: task)
            navigationItem.title = "Edit Reminder"
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed))
        }else {
            self.dataSource = ReminderDetailViewDataSource(task: task)
            navigationItem.leftBarButtonItem = nil
            navigationItem.title = "View Reminder"
            editButtonItem.isEnabled = true
        }
        tableView.dataSource = self.dataSource
        tableView.reloadData()
    }
    
    @objc func cancelPressed(){
        setEditing(false, animated: true)
        
    }
}

extension ReminderDetailViewController {
    
}
