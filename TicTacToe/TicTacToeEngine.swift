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
    var rawData: Array<Array<Int>>
    var currentPlayer = 0
    var currentPlayerText: String {
        get {
            return "Player \(currentPlayer + 1)'s turn"
        }
    }
    
    func play(x: Int, y: Int) {
        // Change data
        rawData[x][y] = (currentPlayer + 1)
        
        // Change player turn
        currentPlayer = (currentPlayer+1) % 2
    }
    
    init() {
        rawData = [[Int]]()
        let emptyRow = [0, 0, 0]
        for var i = 0; i < 3; i++ {
            rawData.append(emptyRow)
        }
    }
}
