//
//  Table view controller.swift
//  UserDefaults
//
//  Created by Mastorah on 01/11/2021.
//

import UIKit

class Table_view_controller: NSObject {
    var items = ["Apples,oragnes","mangos","pears"]
    
    /Users/mas/Desktop/T1000/week-05_HW_UserDefaults_TableViewControllers/UserDefaults/UserDefaults/Table view controller.swiftlet userDefaluts = UserDefaults.standard
    
}
override func viewDidLoad() {
    super.viewDidLoad()
    
    if let setItems = userDefaluts.object(forKey: "items") as? [String] {
        self.items = setItems
    }


}
