import UIKit

open class MFAETableViewController: UITableViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()

        //register differents cells
        self.tableView.registerCell()
        self.tableView.registerFooter()
        self.tableView.registerHeader()
    }

   
    // MARK: - Table view data source
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(forIndexPath: indexPath) ?? UITableViewCell()
    }
    
    override open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeader()
    }
    
    override open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return tableView.dequeueReusableFooter()
    }

}
