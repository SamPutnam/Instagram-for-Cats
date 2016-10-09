//
//  MyLoginViewController.swift
//  Makestagram
//
//  Created by Samuel Putnam on 7/14/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import ParseUI

class MyLogInViewController: PFLogInViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoView = UIImageView(image: UIImage(named:"Wings.png"))
        self.logInView!.logo = logoView
        // Do any additional setup after loading the view.
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
