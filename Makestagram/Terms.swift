//
//  Terms.swift
//  Makestagram
//
//  Created by Samuel Putnam on 10/13/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import UIKit

class Terms: UIViewController {
    
    @IBOutlet weak var termsTextView: UITextView!
    @IBOutlet weak var accceptButton: UIButton!
    
    
    @IBAction func acceptButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "TermsAccepted")
    }
}
