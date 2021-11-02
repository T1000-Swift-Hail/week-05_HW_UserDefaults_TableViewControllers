//
//  TableViewController.swift
//  TableViewControllers
//
//  Created by Mona on 26/03/1443 AH.
//

import UIKit

class TableViewController: UITableViewController {
    
    var shoppingList = ["Apples","Oragnes","Mangos","Pears"]
    
    let Defaluts = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let setItems = Defaluts.object(forKey: "items") as? [String] {
            self.shoppingList = setItems
        }
    }
    
    @IBAction func Edit(_ sender: Any) {
        
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
    
    @IBAction func plus(_ sender: Any) {
        let alert = UIAlertController(title: "write your perchases", message: nil, preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "write here..."
        })
        
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if let frots = alert.textFields?.first?.text {
                print("Your frots: \(frots)")
                self.shoppingList.append(frots)
                self.tableView.reloadData()
            }
        }))
        
        self.present(alert, animated: true)
        
        // MARK: - Table view data source
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shoppingList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        // Configure the cell...
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            shoppingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,to destinationIndexPath: IndexPath) {
        if sourceIndexPath == destinationIndexPath {
            return
        } else {
            let movedItem = shoppingList[sourceIndexPath.row]
            shoppingList.remove(at: sourceIndexPath.row)
            shoppingList.insert(movedItem, at: destinationIndexPath.row)
            
        }
    }
}


