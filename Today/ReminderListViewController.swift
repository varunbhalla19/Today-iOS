import UIKit

class ReminderListViewController: UITableViewController {
    
    private var dataSource: ReminderListDataSource?
    static let segueIdentifier = "ShowReminderDetailSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.segueIdentifier,
        let destination = segue.destination as? ReminderDetailViewController,
        let cell = sender as? UITableViewCell,
           
        let indexPath = tableView.indexPath(for: cell) {
            let row = indexPath.row
            
            guard let task = self.dataSource?.reminder(at: row) else {
                fatalError("Can't find Task lol!")
            }
            
            destination.configure(with: task){task in
                self.dataSource?.update(task, at: row)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = ReminderListDataSource()
        tableView.dataSource = dataSource
    }
    
}
