//
//  UIiTableViewCell.swift
//  shopping list
//
//  Created by mac on 26/03/1443 AH.
//

import UIKit

class UIiTableViewCell: UIViewController {
    let alert = UIAlertController(title: "What's your name?", message: nil, preferredStyle: .alert)
    let defaults = UserDefaults.standard
    var array = ["Hello", "World"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedArray = defaults.array(forKey: "SavedArray") as? [String]{
              array = savedArray
         }
    }
    @IBAction func plas(_ sender: Any) {
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
         textField.placeholder = "Input your name here..."
        })
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in

            if let name = self.alert.textFields?.first?.text {
            print("Your name: \(name)")
          }
       }))
        self.present(alert, animated: true)
        var array = ["Hello", "World"]
        if let savedArray = defaults.array(forKey: "SavedArray") as? [String]{
              array = savedArray
         }
        defaults.set(array, forKey: "SavedArray")
        present(alert, animated: true, completion: nil)
    }
    
     }





