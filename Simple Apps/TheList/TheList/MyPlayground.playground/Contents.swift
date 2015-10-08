import UIKit

protocol ChildDelegate {
    
    func iAmHungry()
    
    
    
}

class Parent : ChildDelegate {
    
    var children: [Child] = []
    
    
    func makeABaby() {
        
        let baby = Child()
        baby.delegate = self
        children.append(baby)
        
    
    
    }
    
    func iAmHungry() {
        //print child is hungry
    }
    
}

class Child {
   
    var delegate: ChildDelegate? //Parent - optional, may not have delegate to talk to
    
    func bellyRumbles() {
        
        delegate?.iAmHungry()
        
        
        
    }
    
    
    
    
}