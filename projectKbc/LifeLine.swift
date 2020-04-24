//
//  LifeLine.swift
//  projectKbc
//
//  Created by Rupika on 2020-03-11.
//  Copyright © 2020 Rupika. All rights reserved.
//

import Foundation

enum LifeLine{
    
    case callFriend
    case askAudience
    case eliminateWrong
}

//which format has to print so we use customstringconvertable
extension LifeLine: CustomStringConvertible {
    var description: String {
        if self == .callFriend{
            return "Call A Friend"
        }
        if self == .askAudience{
            return "Ask Audience"
        }
        if self == .eliminateWrong{
            return "50 - 50"
        }
        return ""
    }
}

