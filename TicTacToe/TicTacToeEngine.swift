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
    
    // 0 - Currently playing
    // 1 - Game won
    // 2 - Game tied
    var gameState: Int = 0
    
    // MARK: Methods
    func calculateGameState() -> Int {
        
        // For now, keeping this broken out
        if checkVictoryOfPlayer(1) {
            return 1
        } else if checkVictoryOfPlayer(2) {
            return 1
        }
        
        return 0
    }
    
    func endTurn() {
        // Change player turn
        currentPlayerValue = (currentPlayerValue+1) % 2
    }
    
    func gameResult() -> (state: Int, message: String) {
        switch gameState {
        case 1:
            return (state: gameState, message: "Player \(currentPlayer) wins")
        default:
            return (state: gameState, message: "Currently playing")
        }
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
    func checkVictoryOfPlayer(playerValue: Int) -> Bool {
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
