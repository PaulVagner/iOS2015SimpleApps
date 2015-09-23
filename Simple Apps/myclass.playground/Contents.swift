import UIKit

// User
//name
//password
//e-mail
//favorite color
// - enum for favorite color

// - hey (name)
// - login (paramters)
// - register
// - logout


enum FavoriteColor: String {
// enum - available options within a location
    


    case Black
    case Orange
    case Purple
    case Blue
    case White
    case Yellow
    case Green
}

//class - this is the blueprint for the object.

class User  {
//var - variables available within the class.
    var name: String!
    var password: String!
    var email: String!
    var favoriteColor: FavoriteColor?
    
    func sayHelloTo(name: String) {
//func - the function within an object
print("\(self.name) says hi to \(name)")
    }
    
    
    func register(name: String, email: String, password: String) {
        
        self.name = name
        self.email = email
        self.password = password
        
// self.abc - reference to the object that i am inside (i.e. self.user)
        

    }
    
}


let Paul = User()
Paul.register("Paul", email: "prodigyzro@gmail.com", password: "stupidpassword")

Paul.sayHelloTo("bob")



////let Paul = User()
////    Paul.name = "Paul"
////print(Paul.name)
//
//
//
////////// Optionals
//
////var color: UIColor?   //optional - no color
////
////color = UIColor.redColor()   //sets the optional as..
////
////if color != nil {
////
////    print(color)
////    
////    
////}
//
//
//var color: String?
//
//
//color = "Red"
//
//print(color == nil)
//
//if color != nil {
//    
//    print(color!)
//}
//
////print("The color is " + color)
//
//if let c = color {
//    print("The color is " + c)
//    
//}
//
//
//
//



