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
    
    let ticTacToeEngine = TicTacToeEngine()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var i = 0
        for button in ticTacToeButtons {
            button.tag = i
            button.setTitle(" ", forState: .Normal)
            i++
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ticTacToeButtonTouched(sender: UIButton) {
        
    }

}

