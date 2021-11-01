//
//  TableViewController.swift
//  ShoppingList
//
//  Created by Majed Alshammari on 26/03/1443 AH.
//

import UIKit

class TableViewController: UITableViewController {

    var products = ["Apples","Oranges","Mangos","Pears"]
    
    let userDefaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let setItems = userDefaults.object(forKey: "item") as? [String] {
            self.products = setItems
        }
        
    }

    // MARK: - Table view data source

    @IBAction func editing(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            products.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    
    @IBAction func adding(_ sender: Any) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add item to shopping list", message: "", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let ok = UIAlertAction(title: "O.K.", style: .default) { ok in
            
            guard let text = textField.text else { return }
            self.products.append(text)
            self.userDefaults.set(self.products, forKey: "item")
            self.tableView.reloadData()
        
        }
        alert.addTextField { settextField in
            settextField.placeholder = "Add item..."
            textField = settextField
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: false)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = products[indexPath.row]

        return cell
    }
    
    

}
