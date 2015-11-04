//
//  ConversationViewController.swift
//  Conversation
//
//  Created by Paul Vagner on 11/3/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

import Parse

class ConversationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var messageField: UITextField!
    
    
    
    
    var user: PFUser! {
        
        didSet {
            
            guard let me = PFUser.currentUser() else { return }
            
            let messageQuery = PFQuery(className: "Message")
            
            messageQuery.whereKey("sender", containedIn: [user, me])
            
            messageQuery.whereKey("receiver", containedIn: [user, me])
            
            messageQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
                
                self.messages = objects ?? []
                
                self.tableView.reloadData()
                
                
            }
        }
    }
    
    
    var messages: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    @IBAction func sendMessage(sender: AnyObject) {
    
        guard let content = messageField.text where content != "" else { return }
        
    let message = PFObject(className: "Message")
        
        message["sender"] = PFUser.currentUser()
        
        message["receiver"] = user
        
        message["content"] = content
    
        message.saveInBackgroundWithBlock { (succeeded, error) -> Void in
        
            //send PUSH TO other device
            // Find devices associated with these users
            
            let pushQuery = PFInstallation.query()
            
            pushQuery?.whereKey("user", equalTo: self.user)
            
            // Send push notification to query
            
            let push = PFPush()
            
            push.setQuery(pushQuery) // Set our Installation query
            
            push.setMessage("\(PFUser.currentUser()?.username ?? "") : \(content)")
            
            push.sendPushInBackground()
        }
    
        messageField.text = nil
        
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ConversationViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messages.count
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCellWithIdentifier("", forIndexPath: indexPath)
        
        let message = messages[indexPath.row]
        
        cell.textLabel?.text = message["content"] as? String
        
        return cell
        
        
    
    }
    
    
}

















