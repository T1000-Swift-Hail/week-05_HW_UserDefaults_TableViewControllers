//
//  TableViewController.swift
//  Shopping List
//
//  Created by noyer altamimi on 26/03/1443 AH.
//

import UIKit

class TableViewController: UITableViewController  {

    
    var items = ["Apples" , "Oranges" , "Mangos" , "Pears"]
    
    let defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let setItems = defaults.array(forKey: "items") as? [String]{
            self.items = setItems
            
        }
    
    }
    
    @IBAction func editing(_ sender: Any) {
        
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
    
    
    
    @IBAction func addItem(_ sender: Any) {
        
    let alert = UIAlertController(title: "Add Item To Shopping List", message: nil, preferredStyle: .alert)
    
alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    

    alert.addTextField(configurationHandler: { textField in
      textField.placeholder = "Add Item..."
     })
    
    
    alert.addAction(UIAlertAction(title: "O.K.", style: .default, handler: { action in

        if let items = alert.textFields?.first?.text {
          print("Your List: \(items)")
            self.items.append(items)
            self.tableView.reloadData()
            
            
        }
     }))

    self.present(alert, animated: true)
    }

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellN", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        // Configure the cell...
        
        return cell
    }
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            
        }
        
        
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,to destinationIndexPath: IndexPath) {
        if sourceIndexPath == destinationIndexPath {
            return
        } else {
            let movedItem = items[sourceIndexPath.row]
            items.remove(at: sourceIndexPath.row)
            items.insert(movedItem, at: destinationIndexPath.row)
            
        }
    }
    
    
}
