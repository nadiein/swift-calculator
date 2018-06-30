//
//  ViewController.swift
//  Calculator
//
//  Created by Igor Nadiein on 29.06.2018.
//  Copyright © 2018 Igor Nadiein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var isUserTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if isUserTyping {
            let currentText = display.text!
            display.text = currentText + digit
        } else {
            display.text = digit
            isUserTyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var logic = CalculatorLogic()
    
    @IBAction func perfomeOperation(_ sender: UIButton) {
        if isUserTyping {
            logic.setOperand(displayValue)
            isUserTyping = false
        }
        
        if let mathSymbol = sender.currentTitle {
            logic.perfomOperation(mathSymbol)
        }
        
        if let result = logic.result {
            displayValue = result
        }
    }
}

