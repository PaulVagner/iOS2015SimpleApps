//
//  ViewController.swift
//  CalculatorRepeat
//
//  Created by Paul Vagner on 9/21/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

var number1 - ""
var number2 - ""
var operation: OperationType?

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var displayOperation: UILabel!
    
    @IBAction func numberPressed(button: UIButton) {
      
        let num = button.titleLabel!.text!
        
        if operation == nil {
            
           number1 += num
           displayLabel.text = number1
            
            
            
        } else {
            number2 += num
            displayLabel.text = number2
            
        }
        
        
    }
    
    
}