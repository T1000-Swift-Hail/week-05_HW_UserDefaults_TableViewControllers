//
//  TableViewController.swift
//  userDefaultsTableViewControllers
//
//  Created by Asma on 01/11/2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var shoppingList = ["ssss","2222"]
    let userDefaluts = UserDefaults.standard
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let setItem = userDefaluts.object(forKey: "shoppingList") as? [String] {
            self.shoppingList = setItem
        }
    }
    
    

    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            tableView.isEditing = true
        } else {
            tableView.isEditing = false
        }
    }

    @IBAction func addButton(_ sender: Any) {

        var textFiled = UITextField()
        let alert = UIAlertController(title: "Add item to shopping list", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { action in
            guard let text = textFiled.text else { return }
            self.shoppingList.append(text)
            self.userDefaluts.set(self.shoppingList, forKey: "shoppingList")
            self.tableView.reloadData()
    }
        
        let cancle = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        alert.addTextField { textFiledSet in
            textFiledSet.placeholder = "Add item..."
            textFiled = textFiledSet
        }
        alert.addAction(cancle)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if sourceIndexPath == destinationIndexPath {
            return
        } else {
            let moveItem = shoppingList[sourceIndexPath.row]
            shoppingList.remove(at: sourceIndexPath.row)
            shoppingList.insert(moveItem, at: destinationIndexPath.row)
        }
    }
    
    
    
    
}
