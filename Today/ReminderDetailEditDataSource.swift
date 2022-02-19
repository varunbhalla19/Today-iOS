//
//  ReminderDetailEditDataSource.swift
//  Today

import UIKit

class ReminderDetailEditDataSource: NSObject {
    
    typealias ReminderUpdateAction = (Task) -> ()
    
    enum ReminderEditSection: Int, CaseIterable {
        case title
        case date
        case notes
        
        func cellIdentifier(for row: Int) -> String{
            switch self {
            case .title:
                return "EditTitleCell"
            case .date:
                return row == 0 ? "EditDateLabelCell" : "EditDateCell"
            case .notes:
                return "EditNotesCell"
            }
        }
        
        func displaySectionTitle() -> String {
            switch self {
            case .title:
                return "Title"
            case .date:
                return "Date"
            case .notes:
                return "Notes"
            }
        }
        
        var numRows: Int {
            switch self {
                case .title, .notes: return 1
                case .date: return 2
            }
        }
        
    }
    
    static var dateLabelCellIdentifier: String {
        return ReminderEditSection.date.cellIdentifier(for: 0)
    }
    
    var reminder: Task
    private var updateReminder: ReminderUpdateAction?
    
    private lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        return formatter
    }()

    init(reminder: Task, updateReminderAction: @escaping ReminderUpdateAction) {
        self.reminder = reminder
        self.updateReminder = updateReminderAction
    }
    
    private func dequeueAndConfigureCell(for indexPath: IndexPath, from tableView: UITableView) -> UITableViewCell {
        guard let section = ReminderEditSection(rawValue: indexPath.section) else {
            fatalError("Lol")
        }
        
        let identifier = section.cellIdentifier(for: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        switch section {
        case .title:
            if let titleCell = cell as? EditTitleCell {
                titleCell.config(title: reminder.title){ title in
                    self.reminder.title = title
                    self.updateReminder?(self.reminder)
                }
            }
        case .date:
            if( indexPath.row == 0 ){
                cell.textLabel?.text = formatter.string(from: reminder.dueDate)
            }else {
                if let dateCell = cell as? EditDateCell {
                    dateCell.config(date: reminder.dueDate){ date in
                        self.reminder.dueDate = date
                        self.updateReminder?(self.reminder)
                        let localIndexpath = IndexPath(row: 0, section: section.rawValue)
                        tableView.reloadRows(at: [localIndexpath], with: .automatic)
                    }
                }
            }
        case .notes:
            if let notesCell = cell as? EditNotesCell {
                notesCell.config(note: reminder.notes){ note in
                    self.reminder.notes = note
                    self.updateReminder?(self.reminder)
                }
            }
        }
        
        return cell
    }
}

extension ReminderDetailEditDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dequeueAndConfigureCell(for: indexPath, from: tableView)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ReminderEditSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderEditSection(rawValue: section)?.numRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = ReminderEditSection(rawValue: section) else {
            fatalError("Invalid Display Lol")
        }
        return section.displaySectionTitle()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}
