//
//  TicTacToeEngineTests.swift
//  TicTacToe
//
//  Created by Felix Barros on 11/1/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeEngineTests: XCTestCase {
    var ticTacToeEngine: TicTacToeEngine!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        ticTacToeEngine = TicTacToeEngine()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDefaultStateOfEngine() {
        let defaultRow = Array(count: 3, repeatedValue: 0)
        let expectedData = Array(count: 3, repeatedValue: defaultRow)
        XCTAssertEqual( ticTacToeEngine.rawData, expectedData)
        XCTAssertEqual( ticTacToeEngine.currentPlayerText, "Player 1's turn")
    }
    
    func testRawDataChangesOnPlays() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        ticTacToeEngine.play(0, y: 2)
        var expectedData = [ [0, 0, 1], [0, 0, 0], [0, 0, 0] ]
        XCTAssertEqual( String(ticTacToeEngine.rawData), String(expectedData) )

        ticTacToeEngine.play(1, y: 2)
        expectedData = [ [0, 0, 1], [0, 0, 2], [0, 0, 0] ]
        XCTAssertEqual( String(ticTacToeEngine.rawData), String(expectedData) )
        
        ticTacToeEngine.play(2, y: 0)
        expectedData = [ [0, 0, 1], [0, 0, 2], [1, 0, 0] ]
        XCTAssertEqual( String(ticTacToeEngine.rawData), String(expectedData) )
    }
    
    func testPlayerTextUpdates() {
        XCTAssertEqual( ticTacToeEngine.currentPlayerText, "Player 1's turn")
        ticTacToeEngine.play(0, y: 0)
        XCTAssertEqual( ticTacToeEngine.currentPlayerText, "Player 2's turn")
        ticTacToeEngine.play(1, y: 0)
        XCTAssertEqual( ticTacToeEngine.currentPlayerText, "Player 1's turn")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}