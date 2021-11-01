//
//  TableViewController.swift
//  UserDefaults
//
//  Created by Hesah Alqhtani on 01/11/2021.
//

import Foundation
import UIKit
class TableViewController: UITableViewController{
    
    var items = ["Apples","Oranges","Mangos","pears"]
    
    
    let userDefaluts = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let Setitems = userDefaluts.object(forKey: "items" )as?[String]{
            self.items = Setitems
        }}
     
    
    
    
    @IBAction func addItem(_ sender: Any) {
        
        var textField = UITextField()
    let alert = UIAlertController(title: "Add item to Shopping List", message: nil, preferredStyle: .alert)
    let action = UIAlertAction(title: "O.K.", style: .default) { action in
        
        
        
        
                guard let text = textField.text else {return}
                  self.items.append(text)
                  self.userDefaluts.set(self.items, forKey: "items")
                 self.tableView.reloadData()
                
                
            
    }
    
        
        
        let cuncel = UIAlertAction(title: "cuncel", style:.cancel, handler: nil)
        alert.addTextField { textFiledSet in
            textFiledSet.placeholder = "Add item.."
            textField = textFiledSet
    
          
        }
      
        
        alert.addAction(action)
        alert.addAction(cuncel)
        
    present(alert, animated: true, completion : nil)}





    @IBAction func edititem(_ sender: Any) {
        
        if tableView.isEditing{
            
            tableView.isEditing = false}
        else {
            tableView.isEditing = true}
        
    }
    
    



    
    
      
        
    override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return items.count
        
        
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
            
        }}
        
override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,to destinationIndexPath: IndexPath) {
    if sourceIndexPath == destinationIndexPath {
        return
    } else {
        let movedItem = items[sourceIndexPath.row]
        items.remove(at: sourceIndexPath.row)
        items.insert(movedItem, at: destinationIndexPath.row)
        
        
        
        
        
        
    }}}





