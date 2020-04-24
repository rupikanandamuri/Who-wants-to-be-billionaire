//
//  Question.swift
//  projectKbc
//
//  Created by Rupika on 2020-03-11.
//  Copyright © 2020 Rupika. All rights reserved.
//

import Foundation

struct Question {
    
    let title:String
    var questionNumber:Int
    let options : [String]
    let answer : String
    
    func printQuestion(){
        
        print("------------------------------------------------------------------")
        print(" Q.\(questionNumber) \(title)")
        print("------------------------------------------------------------------")
        print("A:\(options[0])")
        print("B:\(options[1])")
        print("C:\(options[2])")
        print("D:\(options[3])")
        
        
    }
    @discardableResult
    func checkAnswer(_ userSelection : String) -> Bool{
        let answerIndex = getAnswerIndex(userSelection)
        if options[answerIndex] == answer{
            return true
        }else{
            return false
        }
    }
    
    func getAnswerIndex(_ userAnswer : String) -> Int{
        switch userAnswer {
        case "A":
            return 0
        case "B":
            return 1
        case "C":
            return 2
        case "D":
            return 3
        default:
            return 0
        }
    }
    func askForAnswer(_ mode : GameMode) -> String{
        print("Please enter your answer. Your answer should be either A or B or C or D below")
        
        var acceptL = false
        if mode == .easy {
            print("If you don't know answer enter L or LIFE to get LifeLine")
            acceptL = true
        }else if mode == .hard{
            let round = Helper.getRound(questionNumber, mode: .hard)
            if questionNumber > 5 && round > 1 {
                print("If you don't know answer enter L or LIFE to get LifeLine")
                acceptL = true
            }
        }
        
        var validChoice = false
        let round = Helper.getRound(questionNumber, mode: .hard)
        while validChoice == false {
            if let userChoice = readLine(){
                if userChoice == "A" || userChoice == "B" || userChoice == "C" || userChoice == "D"{
                    validChoice = true
                    return userChoice
                }
                else if userChoice == "L" && round == 1 && mode == .hard{
                    print("Life lines are avialable from round 2 only")
                    print("you cannot able to acess lifeline at this round")
                    print("please select your answer for the above question below")
                }
                else{
                    if acceptL && userChoice == "L" {
                        if userChoice == "L" || userChoice == "LIFE"{
                            print("\n")
                            print("Alright. You wanted to use a life line")
                            return "L"
                        }
                    }
                    else{
                        print("Oh no. It is invalid input. Please enter a valid input LIKE A OR B OR  C OR D")
                        print("\n")
                    }
                }
            }
        }
    }
    
    func askForConfirmation(selectedAnswer : String) ->String{
        print("\n")
        print("You have selected \(selectedAnswer). Are you sure ?")
        print("Enter YES for confirmation, NO for re entering the answer")
        var validChoice = false
        while validChoice == false {
            if let userChoice = readLine(){
                if userChoice == "YES"{
                    validChoice = true
                    return userChoice
                }else if userChoice == "NO"{
                    validChoice = true
                    return userChoice
                }else{
                    print("Oh no. It is invalid input. Please enter a valid input")
                    print("\n")
                }
            }
        }
    }
    
    //    func checkAnswer(_ userSelection : String) -> Bool{
    //           if userSelection == answer{
    //               return true
    //           }else{
    //               return false
    //           }
    //       }
    //
    func printResult(_ isAnswerCorrect : Bool){
        print("\n")
        if isAnswerCorrect{
            print("Hurray! Yoou got it RIGHT")
            //printScoreEasy()
            //printscore
        }else{
            print("Oh no! Yoou got it WRONG")
            print("Thanks for playing the game.")
        }
        print("\n")
    }
    func printScore(){
        print("\n")
        if let score = Bank.getDollarValue(questionNum: questionNumber){
            print("You have earned : \(score)")
            let winscore = Bank.getDollarValue(questionNum: questionNumber)
            if winscore == "$1,000,000"{
                 print("hurray you won the game!! Congrats")
                 print("you have $1,000,000 dollars!!")
            }
        }
    }
    func printScoreEasy(){
        if let score = Bank.getDollarValueEasy(questionNum: questionNumber){
            print("you have earned: \(score)")
            let winscore = score
            if winscore == "1,000,000"{
                 print("hurray you won the game!! Congrats")
                 print("you have $1,000,000 dollars!!")
            }
        }
    }
    
    func elimaterWrongAnswer(){
        print("----------------------------------------")
        print(" /Q.\(questionNumber) \(title)")
        print("-----------------------------------------")
        
        let answerIndex = options.firstIndex(of: answer)
        if answerIndex == 0{
            print("A: \(options[0])")
            print("B: ")
            print("C: ")
            print("D: \(options[3])")
        }
        if answerIndex == 1{
            print("A: ")
            print("B: \(options[1])")
            print("C: \(options[2])")
            print("D: ")
        }
        if answerIndex == 2{
            print("A: ")
            print("B: ")
            print("C: \(options[2])")
            print("D: \(options[3])")
        }
        if answerIndex == 3{
            print("A: ")
            print("B: \(options[1])")
            print("C: ")
            print("D: \(options[3])")
        }
        
    }
    
    func audiencePoll(){
        
        let high = [55,60,45]
        let set1 = [10,30,5]
        let set2 = [5,15,20]
        let set3 = [25,15,15]
        var set : [Int]?
        
        guard let randomHigh = high.randomElement() else {
            return
        }
        let indexOfRandom = high.firstIndex(of: randomHigh)
        
        if indexOfRandom == 0{
            //use set1
            set = set1
        }else if indexOfRandom == 1{
            //use set2
            set = set2
        }else if indexOfRandom == 2{
            //use set3
            set = set3
        }
        print("----------------------------------------")
        print(" /Q.\(questionNumber) \(title)")
        print("-----------------------------------------")
        let answerIndex = options.firstIndex(of: answer)
        if answerIndex == 0{
            print("A: \(options[0]) - Audience poll is \(randomHigh)")
            print("B: \(options[1]) - Audience poll is \(set?[0] ?? 0)")
            print("C: \(options[2]) - Audience poll is \(set?[1] ?? 0)")
            print("D: \(options[3]) - Audience poll is \(set?[2] ?? 0)")
        }
        else if answerIndex == 1{
            print("A: \(options[0]) - Audience poll is \(set?[0] ?? 0)")
            print("B: \(options[1]) - Audience poll is \(randomHigh)")
            print("C: \(options[2]) - Audience poll is \(set?[1] ?? 0)")
            print("D: \(options[3]) - Audience poll is \(set?[2] ?? 0)")
        }
        else if answerIndex == 2{
            print("A: \(options[0]) - Audience poll is \(set?[0] ?? 0)")
            print("B: \(options[1]) - Audience poll is \(set?[1] ?? 0)")
            print("C: \(options[2]) - Audience poll is \(randomHigh)")
            print("D: \(options[3]) - Audience poll is \(set?[2] ?? 0)")
        }
        else if answerIndex == 3{
            print("A: \(options[0]) - Audience poll is \(set?[0] ?? 0)")
            print("B: \(options[1]) - Audience poll is \(set?[1] ?? 0)")
            print("C: \(options[2]) - Audience poll is \(set?[2] ?? 0)")
            print("D: \(options[3]) Audience poll is \(randomHigh)")
        }
    }
    
    func callphone(){
        
        let valueArray = ["yes","no"]
        let randomValueArray = valueArray.randomElement()
        print("----------------------------------------")
        print(" /Q.\(questionNumber) \(title)")
        print("-----------------------------------------")
        let answerIndex = options.firstIndex(of: answer)
        if answerIndex == 0{
            if randomValueArray == "yes"{
                print("A: \(options[0]) - Your friend has given answer")
            }
            else if randomValueArray == "no"{
                print("C: \(options[2]) - Your friend has given answer")
            }
        }
        else if answerIndex == 1{
            if randomValueArray == "yes"{
                print("B: \(options[1]) - Your friend has given answer")
            }
            else if randomValueArray == "no"{
                print("D: \(options[3]) - Your friend has given answer")
            }
        }
        else if answerIndex == 2{
            if randomValueArray == "yes"{
                print("C: \(options[2]) - Your friend has given answer")
            }
            else if randomValueArray == "no"{
                print("A: \(options[0]) - Your friend has given answer")
            }
        }
        else if answerIndex == 3{
            if randomValueArray == "yes"{
                print("D: \(options[3]) - Your friend has given answer")
            }
            else if randomValueArray == "no"{
                print("B: \(options[1]) - Your friend has given answer")
            }
        }
        
    }
    
    
}

