import UIKit

class ReminderListViewController: UITableViewController {
    
    private var dataSource: ReminderListDataSource?
    static let segueIdentifier = "ShowReminderDetailSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.segueIdentifier,
        let destination = segue.destination as? ReminderDetailViewController,
        let cell = sender as? UITableViewCell,
        let index = tableView.indexPath(for: cell)?.row {
            let task = Task.testData[index]
            destination.configure(with: task)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = ReminderListDataSource()
        tableView.dataSource = dataSource
    }
    
}
