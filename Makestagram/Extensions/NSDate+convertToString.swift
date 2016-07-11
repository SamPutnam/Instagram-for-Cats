//
//  NSDate+convertToString.swift
//  Makestagram
//
//  Created by Samuel Putnam on 7/11/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

extension NSDate {
    func convertToString() -> String {
        return NSDateFormatter.localizedStringFromDate(self, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
    }
}