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

    func testViewHas9TaggedButtons() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual( viewController.ticTacToeButtons[0].tag , 0)
        XCTAssertEqual( viewController.ticTacToeButtons[1].tag , 1)
        XCTAssertEqual( viewController.ticTacToeButtons[2].tag , 2)
        XCTAssertEqual( viewController.ticTacToeButtons[3].tag , 3)
        XCTAssertEqual( viewController.ticTacToeButtons[4].tag , 4)
        XCTAssertEqual( viewController.ticTacToeButtons[5].tag , 5)
        XCTAssertEqual( viewController.ticTacToeButtons[6].tag , 6)
        XCTAssertEqual( viewController.ticTacToeButtons[7].tag , 7)
        XCTAssertEqual( viewController.ticTacToeButtons[8].tag , 8)
    }
    
    func testButtonTitlesAreEmpty() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual( viewController.ticTacToeButtons[0].titleLabel?.text , " ")
        XCTAssertEqual( viewController.ticTacToeButtons[1].titleLabel?.text , " ")
        XCTAssertEqual( viewController.ticTacToeButtons[2].titleLabel?.text , " ")
        XCTAssertEqual( viewController.ticTacToeButtons[3].titleLabel?.text , " ")
        XCTAssertEqual( viewController.ticTacToeButtons[4].titleLabel?.text , " ")
        XCTAssertEqual( viewController.ticTacToeButtons[5].titleLabel?.text , " ")
        XCTAssertEqual( viewController.ticTacToeButtons[6].titleLabel?.text , " ")
        XCTAssertEqual( viewController.ticTacToeButtons[7].titleLabel?.text , " ")
        XCTAssertEqual( viewController.ticTacToeButtons[8].titleLabel?.text , " ")
    }
    
//    func testTicTacToeButtonPress() {
//        let button = viewController.ticTacToeButtons[0]
//        XCTAssertEqual( viewController.ticTacToeEngine.currentTurn, 0 )
//        viewController.ticTacToeButtonTouched(button)
//        XCTAssertEqual( viewController.ticTacToeEngine.currentTurn, 1 )
//    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
