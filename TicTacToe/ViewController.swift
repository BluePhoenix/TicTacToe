//
//  ViewController.swift
//  TicTacToe
//
//  Created by Felix Barros on 11/1/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var ticTacToeButtons: [UIButton]!
    @IBOutlet weak var messageLabel: UILabel!
    
    let ticTacToeEngine = TicTacToeEngine()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var i = 0
        for button in ticTacToeButtons {
            button.setTitle(" ", forState: .Normal)
            i++
        }
        
        updateMessages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ticTacToeButtonTouched(sender: UIButton) {
        let coordinates = mapTagToXY(sender.tag)
        ticTacToeEngine.play(coordinates.x, y: coordinates.y)
        updateButtonLabels()
        updateMessages()
    }
    
    // MARK: Helper functions
    func mapTagToXY(tag: Int) -> (x: Int, y: Int) {
        let result: (x: Int, y: Int)
        
        // TODO: There has to be a better way to determine this
        // Leaving like this for now
        switch tag {
        case 0..<3:
            result.x = 0
            result.y = tag
        case 3..<6:
            result.x = 1
            result.y = (tag - 3)
        case 6..<9:
            result.x = 2
            result.y = (tag - 6)
        default:
            // This has to be invalid
            result.x = -1
            result.y = -1
        }
        
        return result
    }
    
    func updateButtonLabels() {
        let buttonStates = ticTacToeEngine.dataArray()
        for var i = 0; i < ticTacToeButtons.count; i++ {
            let titleString: String
            switch buttonStates[i] {
            case 1:
                titleString = "X"
            case 2:
                titleString = "O"
            default:
                titleString = " "
            }
            ticTacToeButtons[i].setTitle(titleString, forState: .Normal)
        }
    }
    
    func updateMessages() {
        messageLabel.text = ticTacToeEngine.currentPlayerText
    }

}

