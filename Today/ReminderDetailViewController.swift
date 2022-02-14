//
//  ReminderDetailViewController.swift
//  Today

import UIKit

class ReminderDetailViewController: UITableViewController {
    
    enum ReminderRow: Int, CaseIterable {
        case title
        case time
        case date
        case notes
        
        func displayText(for task: Task?) -> String? {
            switch self {
            case .title:
                return task?.title
            case .date:
                return task?.dueDate.description
            case .time:
                return task?.dueDate.description
            case .notes:
                return task?.notes
            }
        }
        
        var cellImage: UIImage? {
            switch self {
            case .title:
                return nil
            case .time:
                return UIImage(systemName: "calendar.circle")
            case .date:
                return UIImage(systemName: "clock")
            case .notes:
                return UIImage(systemName: "square.and.pencil")
            }
        }
        
    }
    
    var reminder: Task?
    
    func configure(with task: Task?){
        self.reminder = task
    }
    
}

extension ReminderDetailViewController {
    static let detailIdentifier = "ReminderDetailCell"
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ReminderRow.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.detailIdentifier, for: indexPath)
        let data = ReminderRow(rawValue: indexPath.row)
        
        cell.textLabel?.text = data?.displayText(for: reminder)
        cell.imageView?.image = data?.cellImage
     
        return cell
    }
    
}
