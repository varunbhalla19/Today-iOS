//
//  ReminderDetailViewDataSource.swift
//  Today

import UIKit

class ReminderDetailViewDataSource: NSObject {
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
                guard let date = task?.dueDate else { return nil }
                return Self.dateFormatter.string(from: date)
            case .time:
                guard let time = task?.dueDate else { return nil }
                return Self.timeFormatter.string(from: time)
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
        
        static let timeFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            return formatter
        }()

        static let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.timeStyle = .none
            formatter.dateStyle = .long
            return formatter
        }()
        
    }
    
    private var reminder: Task

    init(task: Task){
        self.reminder = task
        super.init()
    }
    
}

extension ReminderDetailViewDataSource: UITableViewDataSource {
    static let detailIdentifier = "ReminderDetailCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ReminderRow.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.detailIdentifier, for: indexPath)
        let data = ReminderRow(rawValue: indexPath.row)
        
        cell.textLabel?.text = data?.displayText(for: reminder)
        cell.imageView?.image = data?.cellImage
     
        return cell
    }

}
