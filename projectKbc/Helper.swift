//
//  Helper.swift
//  projectKbc
//
//  Created by Rupika on 2020-03-11.
//  Copyright © 2020 Rupika. All rights reserved.
//

import Foundation
struct Helper {
    
   static func getRound(_ questionNumber :Int,mode:GameMode) ->Int{
        if mode == .easy{
            
            if questionNumber >= 0 && questionNumber < 3{
                return 1
            }
            else if questionNumber >= 3 && questionNumber < 6{
                return 2
            }
            else if questionNumber >= 6 && questionNumber < 9{
                return 3
            }
        }
        else if mode == .hard{
            if questionNumber >= 0 && questionNumber < 5 {
                return 1
            }
            else if  questionNumber >= 5 && questionNumber < 10{
                return 2
            }
            else if  questionNumber >= 10 && questionNumber <= 15{
                return 3
            }
        }
        return 0
    }
}
