import UIKit

class ReminderListViewController: UITableViewController {

}

extension ReminderListViewController {
    static let listIdentifier = "ReminderListCell"
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Task.testData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.listIdentifier, for: indexPath) as? ReminderListCell else {
            fatalError("can't find valid cell")
        }
        
        let data = Task.testData[indexPath.row]
        
        cell.titleLabel.text = data.title
        cell.dateLabel.text = data.dueDate.description
        
        // use style: default in xcode.
        cell.circleBtn.setBackgroundImage(UIImage(systemName: data.isComplete ?"circle.fill": "circle" ), for: .normal)
        
        cell.doneBtnAction = {
            Task.testData[indexPath.row].isComplete.toggle()
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        return cell
    }
    
}
