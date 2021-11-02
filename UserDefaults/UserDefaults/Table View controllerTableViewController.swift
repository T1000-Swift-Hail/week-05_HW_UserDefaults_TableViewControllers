//
//  Table View controllerTableViewController.swift
//  UserDefaults
//
//  Created by Mastorah on 01/11/2021.
//

import UIKit

class Table_View_controllerTableViewController: UITableViewController {
    var items = ["Apples","oranges","mangos","pears"]
    
    
    let userDefaluts = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let setItems = userDefaluts.object(forKey: "items") as? [String] {
            self.items = setItems
        }
    
    }
   
    @IBAction func edit(_ sender: Any) {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
    @IBAction func addbutten(_ sender: Any) {
        var textFiled = UITextField()
        let alert = UIAlertController(title: "Add  item to shopping list", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { action in
            guard let text = textFiled.text else {return}
            self.items.append(text)
            self.userDefaluts.set(self.items, forKey: "items")
            self.tableView.reloadData()
            
        }
        let cuncal = UIAlertAction(title: "cuncel", style: .cancel, handler: nil)
        alert.addTextField { textFiledSet in
            textFiledSet.placeholder = "Add item.."
            textFiled = textFiledSet
        }
        alert.addAction(cuncal)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    

 
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
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
    
