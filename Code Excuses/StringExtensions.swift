//
//  StringExtensions.swift
//  Code Excuses
//
//  Created by Ryan Batchelder on 10/22/14.
//  Copyright (c) 2014 Ryan Batchelder. All rights reserved.
//

import Foundation

extension String{
    var length: Int { return Array(self).count }
    
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
    
    func substringToIndex(index: Int) -> String
    {
        return self.substringToIndex(advance(self.startIndex, index))
    }
    
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = advance(self.startIndex, r.startIndex)
            let endIndex = advance(startIndex, r.endIndex - r.startIndex)
            
            return self[Range(start: startIndex, end: endIndex)]
        }
    }
}