//
//  TableViewController.swift
//  Shopping Table
//
//  Created by Asma Rasheed on 26/03/1443 AH.
//

import UIKit

class TableViewController: UITableViewController {
    
    var listShopping = ["Apples", "oranges","mangoes", "pears"]
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let shoppingitem = defaults.object(forKey: "items") as? [String]{
            self.listShopping = shoppingitem
    }}

    
    
    
    @IBAction func addItems(_ sender: Any) {
        var textFiled = UITextField()
        let alert = UIAlertController(title: "Add Item To Shooping List", message: nil, preferredStyle: .alert)
        let add = UIAlertAction(title: "Add", style: .default) { action in
            
            guard let text = textFiled.text else {return}
            self.listShopping.append(text)
            self.defaults.set(self.listShopping, forKey: "items")
            self.tableView.reloadData()
            
        }
  
        let cuncal = UIAlertAction(title: "cuncel", style: .cancel, handler: nil)
        alert.addTextField { textFiledSet in
            textFiledSet.placeholder = "add Item..."
            textFiled = textFiledSet
        }
        alert.addAction(cuncal)
        alert.addAction(add)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func EditItems(_ sender: Any) {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listShopping.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listShopping[indexPath.row]
      
        return cell
}

    
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            listShopping.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,to destinationIndexPath: IndexPath) {
            if sourceIndexPath == destinationIndexPath {
                return
            } else {
                let movedItem = listShopping[sourceIndexPath.row]
                listShopping.remove(at: sourceIndexPath.row)
               listShopping.insert(movedItem, at: destinationIndexPath.row)
                
            }
        }
    }
