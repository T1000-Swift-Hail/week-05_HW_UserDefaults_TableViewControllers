//
//  TableViewController.swift
//  week-05_HW_UserDefaults_TableViewControllers!
//
//  Created by Ahmed Alenazi on 26/03/1443 AH.
//

import UIKit

class TableViewController: UITableViewController  {
    
    var soppingList = ["apple","orenge","mangos","pears"]
    let defaults = UserDefaults.standard
    var array = ["Hello", "World"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        defaults.set(soppingList, forKey: "SavedArray")
        if let setItmes = defaults.array(forKey: "SavedArray") as? [String]{
            self.soppingList = setItmes
            
        }
    }
    
    
    @IBAction func editBotton(_ sender: Any) {
        
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
    @IBAction func addBotton(_ sender: Any) {
        
        let alert = UIAlertController(title: "What are you puying?", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "write here..."
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if let purchase = alert.textFields?.first?.text {
                print("Your purchases: \(purchase)")
                self.soppingList.append(purchase)
                self.defaults.set(self.soppingList, forKey: "SavedArray")
                self.tableView.reloadData()
                
            }
            
        }
                                     )
        )
        
        self.present(alert, animated: true)
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return soppingList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
        cell.textLabel?.text = soppingList[indexPath.row]
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            soppingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.defaults.set(self.soppingList, forKey: "SavedArray")
            
        }
        
        
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,to destinationIndexPath: IndexPath) {
        
        if sourceIndexPath == destinationIndexPath {
            return
        } else {
            let movedItem = soppingList[sourceIndexPath.row]
            soppingList.remove(at: sourceIndexPath.row)
            soppingList.insert(movedItem, at: destinationIndexPath.row)
            
        }
    }
}

/*
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
 
 // Configure the cell...
 
 return cell
 }
 */

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


