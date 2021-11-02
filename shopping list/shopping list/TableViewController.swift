//
//  TableViewController.swift
//  shopping list
//
//  Created by Monafh on 26/03/1443 AH.
//

import UIKit

class TableViewController: UITableViewController {
    
    var itemsOfShopping = ["Apples","Oragnes","mangos", "pears"]
    let userDefaluts = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let setItems = userDefaluts.object(forKey: "items") as? [String] {
            self.itemsOfShopping = setItems
        }
    }
    
   
    @IBAction func EditList(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
    
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        
        var textFiled = UITextField()
        let alert = UIAlertController(title: "Add To you Shopping List...", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { action in
            
            guard let text = textFiled.text else {return}
            self.itemsOfShopping.append(text)
            self.userDefaluts.set(self.itemsOfShopping, forKey: "shoppingList")
            self.tableView.reloadData()
        }
        let cancal = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addTextField { textFiledSet in
            textFiledSet.placeholder = "Add to your shopping list..."
            textFiled = textFiledSet
        }
        alert.addAction(cancal)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsOfShopping.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = itemsOfShopping[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            itemsOfShopping.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,to destinationIndexPath: IndexPath) {
        if sourceIndexPath == destinationIndexPath {
            return
        } else {
            let movedItem = itemsOfShopping[sourceIndexPath.row]
            itemsOfShopping.remove(at: sourceIndexPath.row)
            itemsOfShopping.insert(movedItem, at: destinationIndexPath.row)
            
        }
        
        
        
    }
}
