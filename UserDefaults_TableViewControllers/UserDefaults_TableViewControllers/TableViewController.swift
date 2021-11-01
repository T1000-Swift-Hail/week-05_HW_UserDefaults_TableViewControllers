//
//  TableViewController.swift
//  UserDefaults_TableViewControllers
//
//  Created by Mac on 01/11/2021.
//

import UIKit

class TableViewController:UITableViewController {
    
    var items = ["Apples","Oranges","mangos","pears"]
    let Defaluts = UserDefaults.standard
    var array = ["Hello", "World"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Defaluts.set(array, forKey: "SavedArray")
        if let savedArray = Defaluts.array(forKey: "SavedArray") as? [String] {
            self.array = savedArray
        }
    }
    @IBAction func editTable(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        var textFiled = UITextField()
        let alert = UIAlertController(title: "Write the Product you want", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in
            
            guard let text = textFiled.text else {return}
            self.items.append(text)
            self.Defaluts.set(self.items, forKey: "items")
            self.tableView.reloadData()
            
        }
        let cuncel = UIAlertAction(title: "cuncel", style: .cancel, handler: nil)
        alert.addTextField { textFiledSet in
            textFiledSet.placeholder = "Write here what you need..."
            textFiled = textFiledSet
        }
        alert.addAction(cuncel)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
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


