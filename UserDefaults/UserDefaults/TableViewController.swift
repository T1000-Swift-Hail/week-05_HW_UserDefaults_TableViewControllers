//
//  TableViewController.swift
//  UserDefaults
//
//  Created by Hind Alharbi on 11/1/21.
//

import UIKit

class TableViewController: UITableViewController {
    var items = ["Apple","Orange","Pears"]
    
    
    let userDefaluts = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let setItems = userDefaluts.object(forKey: "items") as? [String] {
            self.items = setItems
        }
    }

    @IBAction func editing(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
                    tableView.isEditing = false
                } else {
                    tableView.isEditing = true
                }
    }
    
    @IBAction func addItem(_ sender: Any) {
        var textFiled = UITextField()
                let alert = UIAlertController(title: "Add Items to the shopping List", message: "", preferredStyle: .alert)
                let action = UIAlertAction(title: "O.K.", style: .default) { action in
                    
                    guard let text = textFiled.text else {return}
                    self.items.append(text)
                    self.userDefaluts.set(self.items, forKey: "items")
                    self.tableView.reloadData()
                    
                }
                let cuncal = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addTextField { textFiledSet in
                    textFiledSet.placeholder = "Add items..."
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
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

   
