//
//  KeyboardNotificationHandler.swift
//  MakeSchoolNotes
//
//  Created by Benjamin Encz on 2/23/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import UIKit

@objc(KeyboardNotificationHandler)
public class KeyboardNotificationHandler: NSObject {
  
  public typealias KeyboardHandlerCallback = (CGFloat) -> ()
  
  public var keyboardWillBeHiddenHandler: KeyboardHandlerCallback?
  public var keyboardWillBeShownHandler:  KeyboardHandlerCallback?
  
  public required override init() {
    super.init()
    
    NSNotificationCenter.defaultCenter().addObserver(self,
      selector: #selector(KeyboardNotificationHandler.keyboardWillBeShown(_:)),
      name: "UIKeyboardWillShowNotification",
      object: nil
    )
    
    NSNotificationCenter.defaultCenter().addObserver(self,
      selector: #selector(KeyboardNotificationHandler.keyboardWillBeHidden(_:)),
      name: "UIKeyboardWillHideNotification",
      object: nil
    )
  }
  
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  public func keyboardWillBeShown(notification: NSNotification) {
    invokeHandler(notification, callback: keyboardWillBeShownHandler)
  }
  
  public func keyboardWillBeHidden(notification: NSNotification) {
    invokeHandler(notification, callback: keyboardWillBeHiddenHandler)
  }
  
  private func invokeHandler(notification: NSNotification, callback: KeyboardHandlerCallback?) {
    if let info = notification.userInfo, let callback = callback {
      let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        callback(keyboardFrame.height)
    }
  }
  
}
