//
//  Note.swift
//  Makestagram
//
//  Created by Samuel Putnam on 7/8/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    
    dynamic var title = ""
    dynamic var content = ""
    dynamic var modificationTime = NSDate()
}