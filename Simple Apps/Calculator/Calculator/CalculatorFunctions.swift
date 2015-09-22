//
//  CalculatorFunctions.swift
//  Calculator
//
//  Created by Paul Vagner on 9/22/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import Foundation

enum OperationType: String {
    case Addition = "+"
    case Subtraction = "-"
    case Multiplication = "x"
    case Division = "/"
    case Modulo = "%"
    
}


func calcNumbers (n1 n1: Double, n2: Double, operation: OperationType) -> Double {
    
    switch operation {
        
    case .Addition : return n1 + n2
        
    case .Subtraction : return n1 - n2
        
    case .Multiplication : return n1 * n2
        
    case .Division : return n1 / n2
        
    case .Modulo : return n1 % n2
        
    }
    
}


//Normal:
// change the sign +/-
// remove decimal if .0

//Medium:
// add label on left side of the dsplay to show current operation

//Hard: 
//make decimal button work

