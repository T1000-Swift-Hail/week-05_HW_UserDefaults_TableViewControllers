//
//  TableViewController.swift
//  UserDefult_ViewTable
//
//  Created by MACBOOK on 26/03/1443 AH.
// i Did Bounes

import UIKit

class TableViewController: UITableViewController {
    
    var fruites = ["Apple","Orange","Mangos","Pears"]
    let defaults = UserDefaults.standard
    var array = ["Hello", "World"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedArray = defaults.array(forKey: "SavedArray") as? [String]{
            self.fruites = savedArray
        }
        
    }
    
    
    @IBAction func editing(_ sender: UIBarButtonItem) {
        
        
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
        
    }
    
    // Bounes
    
    @IBAction func addItem(_ sender: Any) {
        
        var textFiled = UITextField()
        let alert = UIAlertController(title: "Add fruites", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { action in
            
            guard let text = textFiled.text else {return}
            self.fruites.append(text) // array
            self.defaults.set(self.fruites, forKey: "SavedArray")
            self.tableView.reloadData()
            
        }
        let cancal = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addTextField { textFiledSet in
            textFiledSet.placeholder = "Write fruites Name..."
            textFiled = textFiledSet
        }
        alert.addAction(cancal)
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
        return fruites.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fruites[indexPath.row]
        // Configure the cell...
        
        return cell
    }
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            fruites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.defaults.set(self.fruites, forKey: "SavedArray")
        }
        
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if fromIndexPath == destinationIndexPath {
            return
        } else {
            let movedItem = fruites[fromIndexPath.row]
            fruites.remove(at: fromIndexPath.row)
            fruites.insert(movedItem, at: destinationIndexPath.row)
        }
    }
    
    
}
