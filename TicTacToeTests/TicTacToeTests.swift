//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Felix Barros on 11/1/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        viewController = storyboard.instantiateInitialViewController() as! ViewController
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = viewController
        
        // Checks that the view is not nil, and calls the view into existance
        XCTAssertNotNil(viewController.view)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewHasArrayOfButtons() {
        XCTAssertNotNil( viewController.ticTacToeButtons )
    }
    
    func testViewHasTicTacToeModel() {
        XCTAssertNotNil( viewController.ticTacToeEngine )
    }
    
//    func testViewHas9TaggedButtons() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        XCTAssertNotNil( viewController.ticTacToeButtons )
//    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
