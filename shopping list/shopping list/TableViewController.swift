//
//  TableViewController.swift
//  shopping list
//
//  Created by mac on 26/03/1443 AH.
//

import UIKit

class TableViewController: UITableViewController {

    var items = ["Appel", "Orange"]
    
    
    let userDefaluts = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let setItems = userDefaluts.object(forKey: "What's your name?") as? [String] {
            self.items = setItems
        }


    }
    
    @IBAction func editng(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    @IBAction func addItem(_ sender: Any) {
        
        
        var textFiled = UITextField()
        let alert = UIAlertController(title: "Input your name here...", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            
            guard let text = textFiled.text else {return}
            self.items.append(text)
            self.userDefaluts.set(self.items, forKey: "items")
            self.tableView.reloadData()
            
        }
        let cuncal = UIAlertAction(title: "cuncel", style: .cancel, handler: nil)
        alert.addTextField { textFiledSet in
            textFiledSet.placeholder = "Write Name..."
            textFiled = textFiledSet
        }
        alert.addAction(cuncal)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "scell", for: indexPath)
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
