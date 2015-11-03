//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Felix Barros on 11/1/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTappingSomeItems() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let elementsQuery = XCUIApplication().otherElements.containingType(.Button, identifier:" ")
        let allButtons = elementsQuery.childrenMatchingType(.Button)
        let topLeftButton = allButtons.elementBoundByIndex(0)
        topLeftButton.tap()
        XCTAssertEqual( topLeftButton.label, "X" )
        
        let topRightButton = allButtons.elementBoundByIndex(2)
        topRightButton.tap()
        XCTAssertEqual( topRightButton.label, "O" )
        
        let bottomLeftButton = allButtons.elementBoundByIndex(6)
        bottomLeftButton.tap()
        XCTAssertEqual( bottomLeftButton.label, "X" )
        
    }
    
}
