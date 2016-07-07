//
//  PostSectionHeaderView.swift
//  Makestagram
//
//  Created by Samuel Putnam on 7/3/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

class PostSectionHeaderView: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
   
    @IBOutlet weak var postTimeLabel: UILabel!
    var post : Post? {
        didSet {
            if let post = post {
                usernameLabel.text = post.user?.username
                postTimeLabel.text = post.createdAt?.shortTimeAgoSinceDate(NSDate()) ?? ""
            }
        }
    }

}
