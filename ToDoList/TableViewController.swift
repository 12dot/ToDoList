//
//  TableViewController.swift
//  ToDoList
//
//  Created by 12dot on 17.11.2019.
//  Copyright © 2019 12dot. All rights reserved.
//

import UIKit
import AudioToolbox


class TableViewController: UITableViewController {
    
    
    @IBAction func pushEditAction(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                   self.tableView.reloadData()
               }
        //tableView.reloadData()
    }
    
    
    @IBAction func pushAddAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Create new item", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "New item name"
        }
        
        
       let alertAction1 = UIAlertAction(title: "Cancel", style: .default){ (alert) in
        }
        
        
        
        let alertAction2 = UIAlertAction(title: "Create", style: .cancel){ (alert) in
        var newItem = alertController.textFields![0].text
            if (newItem?.trimmingCharacters(in: .whitespaces).isEmpty)! {
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            } else {
            addItem(nameItem: newItem!)
            self.tableView.reloadData()
            }
        }
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ToDoThings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
        let currentItem = ToDoThings[indexPath.row]
        cell.textLabel?.text = currentItem["Name"] as? String
        
        if (currentItem["isCompleted"] as? Bool) == true {
            cell.imageView?.image =  UIImage(named: "check")
        }else{
            cell.imageView?.image = UIImage(named: "uncheck")
        }
        
        cell.textLabel?.textColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0)
        cell.backgroundColor = UIColor(red:1.00, green:0.87, blue:0.98, alpha:1.0)
        tableView.backgroundColor = UIColor(red:1.00, green:0.87, blue:0.98, alpha:1.0)
        
         if tableView.isEditing{
            cell.imageView?.alpha = 0.4
        } else {
            cell.imageView?.alpha = 1
                  // cell.backgroundColor = UIColor(red:0.95, green:0.13, blue:1.00, alpha:1.0)
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
  
    // Override to support editing the table view.

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if    changeState(at: indexPath.row)==true{
            tableView.cellForRow(at: indexPath)?.imageView?.image =  UIImage(named: "check")

        }else{ tableView.cellForRow(at: indexPath)?.imageView?.image =  UIImage(named: "uncheck")
        }
    }
    
    
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
       
        moveItem(fromIndex: fromIndexPath.row, toIndex: to.row)
        tableView.reloadData()
    }

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
