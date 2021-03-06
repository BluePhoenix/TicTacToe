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
            return gameResult().message
        }
    }
    
    var currentTurn: Int {
        get {
            var totalCount = 0
            for row in rawData {
                for cell in row {
                    if cell != 0 {
                        totalCount++
                    }
                }
            }
            return totalCount
        }
    }
    
    // 0 - Currently playing
    // 1 - Game won
    // 2 - Game tied
    var gameState: Int {
        get {
            return calculateGameState()
        }
    }
    
    // MARK: Methods
    func calculateGameState() -> Int {
        if checkVictoryOfPlayer(1) || checkVictoryOfPlayer(2) {
            return 1
        }
        if currentTurn >= 9 {
            return 2
        }
        
        return 0
    }
    
    func dataArray() -> Array<Int> {
        var flatArray = [Int]()
        
        for var i = 0; i < 3; i++ {
            for var j = 0; j < 3; j++ {
                flatArray.append(rawData[i][j])
            }
        }
        
        return flatArray
    }
    
    func endTurn() {
        // Change player turn
        currentPlayerValue = (currentPlayerValue+1) % 2
    }
    
    func gameResult() -> (state: Int, message: String) {
        switch gameState {
        case 1:
            return (state: gameState, message: "Player \(currentPlayer) wins")
        case 2:
            return (state: gameState, message: "Players tied")
        default:
            return (state: gameState, message: "Player \(currentPlayer)'s turn")
        }
    }
    
    func play(x: Int, y: Int) {
        
        // Only allow plays within the grid
        guard 0...2 ~= x && 0...2 ~= y else {
            return
        }
        
        // Only allow plays when game is not tied or won
        guard gameState == 0 else {
            return
        }
        
        // Only accept valid plays, cannot change the value of the same cell
        if rawData[x][y] == 0 {
            // Change data
            rawData[x][y] = (currentPlayer)
            
            // Check new game state
            if calculateGameState() == 0 {
                endTurn()
            }
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
    func checkVictoryOfPlayer(playerValue: Int) -> Bool {
        // For now, keeping this broken out
        if rawData[0][0] == playerValue {
            if rawData[0][1] == playerValue {
                if rawData[0][2] == playerValue {
                    return true
                }
            }
            if rawData[1][0] == playerValue {
                if rawData[2][0] == playerValue {
                    return true
                }
            }
            if  rawData[1][1] == playerValue {
                if rawData[2][2] == playerValue {
                    return true
                }
            }
        }
        
        if rawData[1][0] == playerValue {
            if rawData[1][1] == playerValue {
                if rawData[1][2] == playerValue {
                    return true
                }
            }
        }
        
        if rawData[2][0] == playerValue {
            if rawData[1][1] == playerValue {
                if rawData[0][2] == playerValue {
                    return true
                }
            }
            if rawData[2][1] == playerValue {
                if rawData[2][2] == playerValue {
                    return true
                }
            }
        }
        
        if rawData[0][1] == playerValue {
            if rawData[1][1] == playerValue {
                if rawData[2][1] == playerValue {
                    return true
                }
            }
        }
        
        if rawData[0][2] == playerValue {
            if rawData[1][2] == playerValue {
                if rawData[2][2] == playerValue {
                    return true
                }
            }
        }
        return false
    }
    
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
