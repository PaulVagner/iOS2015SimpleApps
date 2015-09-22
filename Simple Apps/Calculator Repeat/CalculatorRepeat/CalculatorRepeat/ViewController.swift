//
//  ViewController.swift
//  CalculatorRepeat
//
//  Created by Paul Vagner on 9/21/15.
//  Copyright © 2015 Paul Vagner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var displayLabel: UILabel!
    @IBAction func pressZero(sender: AnyObject) {displayLabel.text = "0"
    }
    @IBAction func pressOne(sender: AnyObject) {displayLabel.text = "1"
    }
    @IBAction func presstwo(sender: AnyObject) {displayLabel.text = "2"
    }
    @IBAction func pressThree(sender: AnyObject) {displayLabel.text = "3"
    }
    @IBAction func pressFour(sender: AnyObject) {displayLabel.text = "4"
    }
    @IBAction func pressFive(sender: AnyObject) {displayLabel.text = "5"
    }
    @IBAction func displaySix(sender: AnyObject) {displayLabel.text = "6"
    }
    @IBAction func pressSeven(sender: AnyObject) {displayLabel.text = "7"
    }
    @IBAction func pressEight(sender: AnyObject) {displayLabel.text = "8"
    }
    @IBAction func pressNine(sender: AnyObject) {displayLabel.text = "9"
    }
    @IBAction func doEquals(sender: AnyObject) {print("=")
    }
       
    

}

