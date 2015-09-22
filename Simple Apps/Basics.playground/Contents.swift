//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var age = 32
let name = "Paul"

age += 1

func addNumber (n1: Int, andNumber n2: Int) -> Int {
    
    return n1 + n2
    
}

let value = addNumber(5, andNumber: 7)
let value2 = addNumber(12, andNumber: 23)


var op: OperationType = .Addition


switch op {

case .Addition :
    
    5 + 5

case .Subtraction :

    5 - 5

default :

    print("bad operation")
    
}







OperationType.Addition.rawValue
OperationType.Addition


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

calcNumbers(n1: 3, n2: 2, operation: .Modulo)



