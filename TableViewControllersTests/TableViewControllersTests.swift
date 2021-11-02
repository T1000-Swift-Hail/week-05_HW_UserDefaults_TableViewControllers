//
//  TableViewControllersTests.swift
//  TableViewControllersTests
//
//  Created by Mona on 26/03/1443 AH.
//

import XCTest
@testable import TableViewControllers

class TableViewControllersTests: XCTestCase {
    
    var ShoppingList = ["apples","oragnes","mangos","pears"]
    let userDefaluts = UserDefaults.standard
    
    
    
    override func setUpWithError() throws {
        if let setItems = userDefaluts.object(forKey: "items") as? [String] {
            self.ShoppingList = setItems
        }

    }

    @IBAction func Edit(_ sender: Any) {
        
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
