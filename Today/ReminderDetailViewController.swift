//
//  ReminderDetailViewController.swift
//  Today

import UIKit

class ReminderDetailViewController: UITableViewController {
    
    typealias TaskUpdate = (Task) -> ()
    
    private var reminder: Task?
    private var tempReminder: Task?
    private var dataSource: UITableViewDataSource?
    private var taskUpdateAction: TaskUpdate?
    
    func configure(with reminder: Task, updateTask: @escaping TaskUpdate){
        self.reminder = reminder
        self.taskUpdateAction = updateTask
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
            self.dataSource = ReminderDetailEditDataSource(reminder: task){ reminder in
                self.tempReminder = reminder
                self.editButtonItem.isEnabled = true
            }
            navigationItem.title = "Edit Reminder"
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed))
        }else {
            if let tempReminder = tempReminder {
                self.reminder = tempReminder
                self.tempReminder = nil
                self.taskUpdateAction?(tempReminder)
                self.dataSource = ReminderDetailViewDataSource(task: tempReminder)
            }else {
                self.dataSource = ReminderDetailViewDataSource(task: task)
            }
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
