//
//  ReminderListDataSource.swift
//  Today

import UIKit

class ReminderListDataSource: NSObject {
    private lazy var dateFormatter = RelativeDateTimeFormatter()
    
    func update(_ reminder: Task, at row: Int) {
        Task.testData[row] = reminder
    }

    func reminder(at row: Int) -> Task {
        return Task.testData[row]
    }
    
}

extension ReminderListDataSource: UITableViewDataSource {
    static let listIdentifier = "ReminderListCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Task.testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.listIdentifier, for: indexPath) as? ReminderListCell else {
            fatalError("can't find valid cell")
        }
        
        let data = Task.testData[indexPath.row]
        let dateText = dateFormatter.localizedString(for: data.dueDate, relativeTo: Date())
        cell.configure(title: data.title, date: dateText, isComplete: data.isComplete, doneAction: {
            Task.testData[indexPath.row].isComplete.toggle()
            tableView.reloadRows(at: [indexPath], with: .fade)
        })

        return cell
    }
    
}
