//
//  TicTacToeEngine.swift
//  TicTacToe
//
//  Created by Felix Barros on 11/1/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import Foundation


// Since I am learning, I am implementing all this myself
// However, a good alternative might be https://github.com/scottsievert/swix
class TicTacToeEngine {

    // MARK: Properties
    internal var rawData: Array<Array<Int>>
    internal var currentPlayerValue = 0
    var currentPlayer: Int {
        get {
            return currentPlayerValue + 1
        }
    }
    
    var currentPlayerText: String {
        get {
            return "Player \(currentPlayer)'s turn"
        }
    }
    
    // MARK: Methods
    func endTurn() {
        // Change player turn
        currentPlayerValue = (currentPlayerValue+1) % 2
    }
    
    func play(x: Int, y: Int) {
        // Only accept valid plays, cannot change the value of the same cell
        if rawData[x][y] == 0 {
            // Change data
            rawData[x][y] = (currentPlayer)
            
            endTurn()
        }
    }
    
    func reset() {
        resetInternalData()
    }
    
    init() {
        rawData = [[Int]]()
        resetInternalData()
    }
    
    // MARK: Helper functions
    func resetInternalData() {
        // Clear raw data
        rawData = [[Int]]()
        let emptyRow = [0, 0, 0]
        for var i = 0; i < 3; i++ {
            rawData.append(emptyRow)
        }
        
        // Reset default player
        currentPlayerValue = 0
    }
    
}
