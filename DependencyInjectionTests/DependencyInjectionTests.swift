//
//  DependencyInjectionTests.swift
//  DependencyInjectionTests
//
//  Created by Annie Tung on 5/4/17.
//  Copyright © 2017 Annie Tung. All rights reserved.
//

import XCTest
@testable import DependencyInjection

class DependencyInjectionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Test Example
    func testDataSource() {
        let vc = ViewController(with: TestDataSource()) // instantiate viewController with TestDataSource, also injecting here
        
        let expectedRows = 3; // expecting 3 rows
        XCTAssertTrue(vc.tableView.numberOfRows(inSection: 0) == expectedRows)
        
        let cell = vc.tableView.dataSource?.tableView(vc.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell) // make sure there is a cell
        
        XCTAssertEqual(cell?.textLabel?.text, "Row 0") // first row will have a text
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
