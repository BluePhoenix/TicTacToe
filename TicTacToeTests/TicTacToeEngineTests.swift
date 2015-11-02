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
    
    func testSelectingSameCellIsNotValid() {
        XCTAssertEqual( ticTacToeEngine.currentPlayerValue, 0)
        ticTacToeEngine.play(0, y: 0)
        XCTAssertEqual( ticTacToeEngine.currentPlayerValue, 1)
        ticTacToeEngine.play(0, y: 0)
        XCTAssertEqual( ticTacToeEngine.currentPlayerValue, 1)
        ticTacToeEngine.play(1, y: 0)
        XCTAssertNotEqual( ticTacToeEngine.currentPlayerValue, 1)
    }
    
    func testGameReset() {
        let t = ticTacToeEngine
        t.play(0, y: 0)
        t.play(2, y: 2)
        t.play(2, y: 0)
        XCTAssertEqual( t.rawData, [ [1, 0, 0], [0, 0, 0], [1, 0, 2] ] )
        
        t.reset()
        XCTAssertEqual( String(t.rawData), String([ [0, 0, 0], [0, 0, 0], [0, 0, 0] ]) )
        XCTAssertEqual( t.currentPlayerValue, 0)
        XCTAssertEqual( t.gameState, 0)
    }
    
    func testVictoryCondition() {
        let t = ticTacToeEngine
        t.rawData = [ [1, 0, 0], [0, 0, 0], [1, 0, 2] ]
        XCTAssertEqual( t.calculateGameState(), 0 )
        t.rawData =
            [
                [1, 0, 2],
                [1, 0, 0],
                [1, 0, 2]
        ]
        XCTAssertEqual( t.calculateGameState(), 1 )
        
        t.rawData = [ [2, 0, 0], [1, 0, 1], [1, 0, 2] ]
        XCTAssertEqual( t.calculateGameState(), 0 )
    }
    
    func testVictoryConditionFakeMatches() {
        let t = ticTacToeEngine
        t.rawData = [ [1, 0, 0], [0, 0, 0], [1, 0, 2] ]
        XCTAssertEqual( t.calculateGameState(), 0 )
        t.rawData =
            [
                [1, 1, 2],
                [0, 1, 0],
                [2, 1, 2]
        ]
        XCTAssertEqual( t.calculateGameState(), 1 )
        
        t.rawData = [ [2, 0, 0], [1, 0, 1], [1, 0, 2] ]
        XCTAssertEqual( t.calculateGameState(), 0 )
        
        t.rawData =
            [
                [1, 1, 2],
                [1, 0, 0],
                [1, 2, 2]
        ]
        XCTAssertEqual( t.calculateGameState(), 1 )
    }
    
    func testPlayerWins() {
        let t = ticTacToeEngine
        t.play(0, y: 2)
        t.play(1, y: 0)
        t.play(1, y: 1)
        t.play(1, y: 2)
        t.play(2, y: 0)
        XCTAssertEqual( t.gameResult().message, "Player 1 wins")
    }
  
    func testTurnCount() {
        let t = ticTacToeEngine
        t.play(1, y: 1)
        XCTAssertEqual( t.currentTurn, 1)
        t.play(1, y: 1)
        XCTAssertEqual( t.currentTurn, 1)
        t.play(0, y: 0)
        t.play(2, y: 0)
        t.play(0, y: 2)
        t.play(0, y: 1)
        t.play(2, y: 1)
        t.play(1, y: 0)
        t.play(1, y: 2)
        t.play(2, y: 2)
        XCTAssertEqual( t.currentTurn, 9)
    }

    
    func testPlayersTied() {
        let t = ticTacToeEngine
        t.play(1, y: 1)
        t.play(0, y: 0)
        t.play(2, y: 0)
        t.play(0, y: 2)
        t.play(0, y: 1)
        t.play(2, y: 1)
        t.play(1, y: 0)
        t.play(1, y: 2)
        t.play(2, y: 2)
        XCTAssertEqual( t.gameResult().message, "Players tied")
    }

    func testPerformanceForWinningData() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
            let t = self.ticTacToeEngine
            t.rawData =
                [
                    [1, 0, 2],
                    [1, 0, 0],
                    [1, 0, 2]
            ]
            for var i = 0; i < 5000; i++ {
                t.calculateGameState()
            }
        }
    }

    func testPerformanceForNonWinningData() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
            let t = self.ticTacToeEngine
            t.rawData =
                [
                    [1, 0, 2],
                    [0, 1, 0],
                    [1, 0, 2]
            ]
            for var i = 0; i < 5000; i++ {
                t.calculateGameState()
            }
        }
    }
    
}
