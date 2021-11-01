//
//  TableViewController.swift
//  TableViewControllers
//
//  Created by iAbdullah17 on 26/03/1443 AH.
//

import UIKit

class TableViewController: UITableViewController {
    
    var shopping = ["Apples", "Oranges", "Mangos", "Pears"]
    
    let userDefaluts = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let setShopping = userDefaluts.object(forKey: "items") as? [String] {
            self.shopping = setShopping

            }
    }
    
     @IBAction func Editing(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            tableView.isEditing = false
        }
        else {
            tableView.isEditing = true
            
        }
        }
    
    @IBAction func Adding(_ sender: Any) {
        var textFiled = UITextField()
        
        let add = UIAlertController(title: "Add Item to Shopping List", message: "", preferredStyle: .alert)
        let done = UIAlertAction(title: "OK", style: .default) { action in
            guard let text = textFiled.text else {return}
            self.shopping.append(text)
            self.userDefaluts.set(self.shopping, forKey: "items")
            self.tableView.reloadData()
            
    }
            let canceel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
            add.addTextField { SetText in
                SetText.placeholder = "Add Item..."
                textFiled = SetText
                
            }
            
            add.addAction(canceel)
            add.addAction(done)
            
            present (add, animated: true)
        
}
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
                return shopping.count
            }



    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = shopping[indexPath.row]
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            shopping.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
}
}
    
