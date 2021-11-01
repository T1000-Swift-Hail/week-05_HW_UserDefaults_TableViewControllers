//
//  TableviewControll.swift
//  UserDefaults_TableViewController
//
//  Created by AryafAlaqabali on 26/03/1443 AH.
//

import UIKit


    class TableViewController: UITableViewController{
        
        var arrayFruits = ["Apples", "oranges", "mangos", "pears"]
        let userDefaluts = UserDefaults.standard
       
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let setarrayFruits = userDefaluts.object(forKey: "arrayFruits") as? [String]
        {
                self.arrayFruits = setarrayFruits
              }
        }
        
        
        @IBAction func addFruits(_ sender: Any) {
        
        
        var textFiled = UITextField()
        let alert = UIAlertController(title: "Add Fruits Shopping list", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok ", style: .default) { action in
       
               guard let text = textFiled.text else {return}
                self.arrayFruits.append(text)
                self.userDefaluts.set(self.arrayFruits, forKey: "arrayFruits")
                self.tableView.reloadData()

            }
            let cuncal = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            alert.addTextField { textFiledSet in
                textFiledSet.placeholder = "Add Fruits..."
                textFiled = textFiledSet
            }
            alert.addAction(cuncal)
            alert.addAction(action)

            present(alert, animated: true, completion: nil)

        }
    

        @IBAction func editShoppingList(_ sender: Any) {
        
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
        }
    
        // MARK: - Table view data source
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return arrayFruits.count
        }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = arrayFruits[indexPath.row]
            // Configure the cell...
            
            return cell
        }
        
        override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
            
            if editingStyle == .delete {
                
                arrayFruits.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
                
            }
            
            
        }
        override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,to destinationIndexPath: IndexPath) {
            if sourceIndexPath == destinationIndexPath {
                return
            } else {
                let movedItem = arrayFruits[sourceIndexPath.row]
                arrayFruits.remove(at: sourceIndexPath.row)
                arrayFruits.insert(movedItem, at: destinationIndexPath.row)
                
            }
        }
    }
