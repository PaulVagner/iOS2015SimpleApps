//: Playground - noun: a place where people can play

import UIKit

////// Struct









var name = "Paul"

unsafeAddressOf(name)

////// Swift String Struct - does not share references with others. (Makes copie of infor and places to new location on RAM)

var name2 = name

unsafeAddressOf(name2)

name2.appendContentsOf("e")



////// Class

var name3: NSMutableString = "Paul"
///////NSString - 95% of time functions with Class

unsafeAddressOf(name3)

var name4 = name3

unsafeAddressOf(name4)

name4.appendString("e")
name3

//// Class allows for changes in the structure
///// Appendments within the Class create the changes in both values.

name3 = "Paul2" // the "=" assigns the information to a new value.
name4

name4.appendString("y")
name3

name3 = "Jim" //name3 creates a NEW instance which is stored in a new location on RAM
name4



