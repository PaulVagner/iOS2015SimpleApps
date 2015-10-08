//
//  ListTableViewController.swift
//  TheList
//
//  Created by Paul Vagner on 9/28/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

let API_ROOT = "https://api.github.com" // Global Constants defined

let myProfileURL = API_ROOT + "/users/paulvagner"


class ListTableViewController: UITableViewController {
    
    // array of strings
    var listItems: [[String:AnyObject]] = [
        
        
        ["name" : "Steve", "likes" : 12], // <--- dictionary (Key Value Pair) - consists of string and anyobject
        
        ["name" : "Banana", "likes" : 30],
        
        ["name" : "Despicable", "likes" : 100], // <--- data structure..... shares identical parameters.
        
        ["name" : "Me", "likes" : 2],
        
        ["name" : "Gru", "likes" : 5],
        
        ["name" : "Vit"],
        
        ["likes" : 12]
        
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 1
    //    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listItems.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath)
        
        // Configure the cell...
        // index path
        // - row
        // - section
        
        
        let listItem = listItems[indexPath.row]
        
        let name = listItem["name"] as? String ?? "No Name" // <-- this line denotes that whent there is no name in the item list, then it will whow up as "No Name"
        let likes = listItem["likes"] as? Int ?? 0 // <--- this line denotes when there is no value for "likes" then it will display 0
        
        cell.textLabel?.text = "\(name) \(likes)" //"!" means force-unwrapping
        
//        if let name = listItem["name"] as? String,
//           let likes = listItem["likes"] as? Int {
//            
        
        //this is casting  --- left is anyobject, right --- it should be a string (here)
        
            
          //
            
            
       // }
        
        
        return cell
        
    }

//// JSON - Java Script Object Notations
    
/*
// Override to support conditional editing of the table view.
override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
// Return false if you do not want the specified item to be editable.
return true
}
*/

/*
// Override to support editing the table view.
override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
if editingStyle == .Delete {
// Delete the row from the data source
tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
} else if editingStyle == .Insert {
// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
}
}
*/

/*
// Override to support rearranging the table view.
override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

}
*/

/*
// Override to support conditional rearranging of the table view.
override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
// Return false if you do not want the item to be re-orderable.
return true
}
*/

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/


/////// creates items and put them into placeholder lines.
}