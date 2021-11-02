//
//  TableViewController.swift
//  HW_UserDefaults_TableViewControllers
//
//  Created by mona aleid on 26/03/1443 AH.
//

import UIKit

class TableViewController: UITableViewController{

    var fruits = ["Apples", "oranges", "mangos", "pears"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let setFruits = defaults.object(forKey: "fruits") as? [String] {
            self.fruits = setFruits
        }
    }

    @IBAction func Edit(_ sender: Any) {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    

    @IBAction func Add(_ sender: Any) {
        var textFiled = UITextField()
        let alert = UIAlertController(title: "Add Fruits to shopping list ", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "O.K.", style: .default) { action in
            
            guard let text = textFiled.text else {return}
            self.fruits.append(text)
            self.defaults.set(self.fruits, forKey: "fruits")
            self.tableView.reloadData()
           
    }
        let cancal = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addTextField { textFiledSet in
            textFiledSet.placeholder = "add fruits..."
            textFiled = textFiledSet
        }
        alert.addAction(cancal)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        // Configure the cell...
        
        return cell
    }
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            fruits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            
        }
        
        
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,to destinationIndexPath: IndexPath) {
        if sourceIndexPath == destinationIndexPath {
            return
        } else {
            let movedItem = fruits[sourceIndexPath.row]
            fruits.remove(at: sourceIndexPath.row)
            fruits.insert(movedItem, at: destinationIndexPath.row)
            
        }
    }
}
