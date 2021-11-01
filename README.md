# week-05_HW_UserDefaults_TableViewControllers

## Using what you've learned , We are going to create a shopping list ! The application should allow you to add new items to the shopping list .  The new application should have the following requirements :

- A Table View Controller
- A Navigation View Controller
- Title : Shopping List
- A bar button item , with property System Item Add .
- When clicking on the Add button, user should be presented with an UIAlertController for adding new items to the shopping list.
- Application should save the new added items using UserDefaults.
- Applicaiton should load the saved data when closed & launched again.



## Bonus
- Your application should be able to delete items from the shopping list.

## Resources :

### UIAlertController
     
      //getting an instance of UIAlertController
      let alert = UIAlertController(title: "What's your name?", message: nil, preferredStyle: .alert)
      
      //Adding Cancel Button
      alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
      
      //adding a text field
      alert.addTextField(configurationHandler: { textField in
       textField.placeholder = "Input your name here..."
      })
      
      //adding an action "O.K."
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in

        if let name = alert.textFields?.first?.text {
          print("Your name: \(name)")
        }
     }))

    self.present(alert, animated: true)
    
    
### UserDefaults
      
      //getting an instance of UserDefaults
      let defaults = UserDefaults.standard
      
      //defining an array
      let array = ["Hello", "World"]
      
      //saving the array
      defaults.set(array, forKey: "SavedArray")
      
      //load  the saved array
      if let savedArray = defaults.array(forKey: "SavedArray") as? [String]{
            array = savedArray
       }
       
       
       
### Your app should look similar to this:
![alt text]()

