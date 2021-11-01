//
//  TableViewController.swift
//  HW_UserDefaults_TableViewControllers
//
//  Created by Njoud Alrshidi on 26/03/1443 AH.
//

import UIKit

class TableViewController: UITableViewController {

    
    var itemsFruits = ["Apples","oragnes","mangos" , "pears"]
    let userDefaluts = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let setitemsFruits = userDefaluts.object(forKey: "itemsFruits") as? [String] {
            self.itemsFruits = setitemsFruits
        }}
        
    
    
    @IBAction func addItems(_ sender: Any) {
    
    
                var textFiled = UITextField()
                let alert = UIAlertController(title: "Add Fruits", message: "", preferredStyle: .alert)
                let action = UIAlertAction(title: "Add", style: .default) { action in
    
                    guard let text = textFiled.text else {return}
                    self.itemsFruits.append(text)
                    self.userDefaluts.set(self.itemsFruits, forKey: "itemsFruits")
                    self.tableView.reloadData()
    
                }
                let cuncal = UIAlertAction(title: "cuncel", style: .cancel, handler: nil)
                alert.addTextField { textFiledSet in
                    textFiledSet.placeholder = "Add Fruits name..."
                    textFiled = textFiledSet
                }
                alert.addAction(cuncal)
                alert.addAction(action)
    
                present(alert, animated: true, completion: nil)
}
    
    
    @IBAction func editFruits(_ sender: Any) {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
                return 1
            }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return itemsFruits.count
            }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
                let celll = tableView.dequeueReusableCell(withIdentifier: "celll", for: indexPath)
                celll.textLabel?.text = itemsFruits[indexPath.row]
                return celll
            }
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            itemsFruits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,to destinationIndexPath: IndexPath) {
        if sourceIndexPath == destinationIndexPath {
            return
        } else {
            let movedItem = itemsFruits[sourceIndexPath.row]
            itemsFruits.remove(at: sourceIndexPath.row)
            itemsFruits.insert(movedItem, at: destinationIndexPath.row)
            
        }
    }

}

      











