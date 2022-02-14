//
//  ReminderListDataSource.swift
//  Today

import UIKit

class ReminderListDataSource: NSObject {
    
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
        
        cell.configure(title: data.title, date: data.dueDate.description, isComplete: data.isComplete, doneAction: {
            Task.testData[indexPath.row].isComplete.toggle()
            tableView.reloadRows(at: [indexPath], with: .fade)
        })

        return cell
    }
    
}
