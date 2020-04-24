//
//  Bank.swift
//  projectKbc
//
//  Created by Rupika on 2020-03-11.
//  Copyright © 2020 Rupika. All rights reserved.
//

import Foundation
struct Bank{
    
   static let dollarMapHard = [1:"$100",2:"$200",3:"$300",4:"$500",5:"$1000",6:"$2000",7:"$4000",8:"$8000",9:"$16000",10:"$32000",11:"$64000",12:"$125,000",13:"$250,000",14:"$500,000",15:"$1,000,000"]
    static let dollarMapEasy = [1:"$100",2:"$500",3:"$1,000",4:"$8,000",5:"$16,000",6:"$32,000",7:"$125,000",8:"$500,000",9:"1,000,000"]
    
   static func getDollarValue(questionNum : Int) -> String?{
        if let value = dollarMapHard[questionNum]{
            return value
        }
        return .none
    }
  
    static func getDollarValueEasy(questionNum : Int) -> String?{
        if let value = dollarMapEasy[questionNum]{
            return value
        }
        return .none
    }
}
