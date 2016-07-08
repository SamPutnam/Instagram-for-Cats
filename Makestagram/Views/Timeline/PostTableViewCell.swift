//
//  PostTableViewCell.swift
//  Makestagram
//
//  Created by Samuel Putnam on 7/1/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import Bond
import Parse

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likesIconImageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var postContentTextView: UITextView!
   
    var postDisposable: DisposableType?
    var likeDisposable: DisposableType?
    
    weak var timeline: TimelineViewController?
    
    var post: Post? {
        didSet {
            postDisposable?.dispose()
            likeDisposable?.dispose()
            // free memory of image stored with post that is no longer displayed
            if let oldValue = oldValue where oldValue != post {
                oldValue.image.value = nil
            }
            if let post = post {
                postDisposable = post.image.bindTo(postImageView.bnd_image)
                likeDisposable = post.likes.observe { (value: [PFUser]?) -> () in
                    if let value = value {
                        self.likesLabel.text = self.stringFromUserList(value)
                        self.likeButton.selected = value.contains(PFUser.currentUser()!)
                        self.likesIconImageView.hidden = (value.count == 0)
                        self.postContentTextView.text = self.post?.content
                    } else {
                        self.likesLabel.text = ""
                        self.likeButton.selected = false
                        self.likesIconImageView.hidden = true
                        self.postContentTextView.hidden = true
                    }
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // Generates a comma separated list of usernames from an array (e.g. "User1", User2")
    
    func stringFromUserList(userList: [PFUser]) -> String {
        let usernameList = userList.map {user in user.username!}
        let commaSeparatedUserList = usernameList.joinWithSeparator(",")
        return commaSeparatedUserList
    }
    
    // technically, this should live in the VC, decide whether or not we should keep it here for simplicity
    @IBAction func likeButonTapped(sender: AnyObject) {
        post?.toggleLikePost(PFUser.currentUser()!)
    }
    
    @IBAction func moreButtonTapped(sender: AnyObject) {
         timeline?.showActionSheetForPost(post!)
    }

}
