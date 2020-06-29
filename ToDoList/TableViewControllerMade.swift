//
//  TableViewControllerMade.swift
//  ToDoList
//
//  Created by 12dot on 14.12.2019.
//  Copyright © 2019 12dot. All rights reserved.
//

import UIKit

class TableViewControllerMade: UITableViewController {


    @IBAction func refreshMade(_ sender: UIRefreshControl) {
        tableView.reloadData()
        sender.endRefreshing()
    }

override func viewDidLoad() {
    super.viewDidLoad()

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem

}

// MARK: - Table view data source

override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return completedArray().count
}


override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellMade", for: indexPath)
        
    var completedArrayFalse = completedArray()
    let currentItem = completedArrayFalse[indexPath.row]
    
    if (currentItem["isCompleted"] as? Bool) == true {
            cell.textLabel?.text = currentItem["Name"] as? String
            cell.imageView?.image = UIImage(named: "check")
    }
        
    cell.textLabel?.textColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0)
    cell.backgroundColor = UIColor(red:1.00, green:0.87, blue:0.98, alpha:1.0)
    tableView.backgroundColor = UIColor(red:1.00, green:0.87, blue:0.98, alpha:1.0)
    
    return cell
}


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
