//
//  Game.swift
//  projectKbc
//
//  Created by Rupika on 2020-03-11.
//  Copyright © 2020 Rupika. All rights reserved.
//

import Foundation

protocol LifeLines {
    func performCallAFriend()
    func performAskAudience()
    func performEliminateWrong()
}
class Game{
    
    var playerName : String
    var gameMode : GameMode?
    var currentRound = 0
    var dataSource : Datasource?
    var lifeLine : [LifeLine] = [.callFriend , .askAudience, .eliminateWrong]
    //the question which is displayed to the user,every opertaion should be performed on current question,in start round method get data source and assigned to currentQuestion
    var currentQuestion :Question?
    //to get the question index from datasource
    var currentQuestionIndex = 0
    var gameFinished = false
    
    init(player : String) {
        self.playerName = player
    }
    
    func numberOfQuesrions(mode:GameMode) -> Int{
        
        if mode == .easy{
            return 9
        }
        else{
            return 15
        }
    }
    
    func startGame(){
        
        print("Welcome \(playerName)")
        print("\n")
        print("NOTE: After the question displays, if you need a life line , enter L or LIFE anytime")
        print("Note you should enter YES/NO only in UPPER case only")
        print("please select a game mode.")
        print("Enter 1 for EASY,Enter 2 for HARD mode.")
        print("\n")
        dataSource = Datasource()
        //here randomising the questions
        dataSource?.refreshQuestionNo()
        
        var gameModeChoosen = false
        
        while gameModeChoosen == false{
            if let modeInput = readLine(){
                if modeInput == "1"{
                    gameMode = .easy
                    gameModeChoosen = true
                }
                else if modeInput == "2"{
                    gameMode = .hard
                    gameModeChoosen = true
                }
                else{
                    print("oh no. It is inavalid input. Please enter a valid input")
                    print("\n")
                }
            }
        }
        
        print("Thats it \(playerName)")
        print("You have chossen \(gameMode!)")
        print("\n")
        
        //we are calling start rounds dunction
        startRounds()
        gameFinished = false
    }
    
    
    
    func startRounds(){
        while gameFinished == false{
            let round = Helper.getRound(currentQuestionIndex,mode: gameMode!)
            print("Round \(round)")
            if var question = dataSource?.questions[currentQuestionIndex]{
                currentQuestion = question
                question.printQuestion()
                let answer = question.askForAnswer(gameMode ?? .easy)
                let confirmAnswer = question.askForConfirmation(selectedAnswer: answer)
                if gameMode == .easy {
                    
                    if confirmAnswer == "YES"{
                        if answer == "L"{
                            printLifeLines()
                        }else{
                            doValidation(answer)
                        }
                    }
                    else if confirmAnswer == "NO"{
                        
                        if let newAnswer = currentQuestion?.askForAnswer(gameMode ?? .easy){
                            if newAnswer == "L"{
                                printLifeLines()
                            }else{
                                doValidation(newAnswer)
                            }
                        }
                    }
                }
                else if gameMode == .hard {
                        
                        if confirmAnswer == "YES"{
                            if answer == "L"{
                                printLifeLines()
                            }else{
                                doValidation(answer)
                            }
                        }
                        else if confirmAnswer == "NO"{
                            if let newAnswer = currentQuestion?.askForAnswer(gameMode ?? .easy){
                                if newAnswer == "L"{
                                    printLifeLines()
                                }else{
                                    doValidation(newAnswer)
                                }
                            }
                        }
                        
                    }
                    
                
                
                if gameMode == .easy{
                    if currentQuestionIndex > 2 && round == 1{
                        walOut()
                    }
                    else if  currentQuestionIndex > 5 && round == 2{
                        walOut()
                    }
                    if question.questionNumber > 8{
                        gameFinished = true
                    }
                }else if gameMode == .hard{
                    if currentQuestionIndex > 4 && round == 1{
                        walOut()
                    }
                    else if  currentQuestionIndex > 9 && round == 2 {
                        walOut()
                    }
                    if question.questionNumber > 14{
                        gameFinished = true
                    }
                }
            }
        }
    }
    
    
    
    func doValidation(_ answer : String){
        if currentQuestion?.checkAnswer(answer) ?? false {
            currentQuestion?.printResult(true)
            currentQuestionIndex += 1
            if gameMode == .easy{
                currentQuestion?.printScoreEasy()
            }
            else if gameMode == .hard{
                currentQuestion?.printScore()
            }
            
        }else{
            currentQuestion?.printResult(false)
            gameFinished = true
        }
    }
    
    func walOut() {
        print("Do you want to walkOut of the game")
        print("Enter 1 for walkout,Enter 2 for continue to another round.")
        if let walk = readLine(){
            var optionChoosen = false
            while optionChoosen == false{
                if walk == "1"{
                    print("congratulations!!")
                    if gameMode == .easy{
                        currentQuestion?.printScoreEasy()
                    }
                    else if gameMode == .hard{
                        currentQuestion?.printScore()
                    }
                    print("You choosed walout")
                    optionChoosen = true
                    gameFinished = true
                    
                }
                else if walk == "2"{
                    print("you are entering into another round")
                    startRounds()
                    optionChoosen = true
                    
                }
                else{
                    print("invalida input enter valida input either 1 or 2")
                }
            }
        }
    }
}
extension Game{
    
    func printLifeLines(){
        if lifeLine.count != 0{
            print("you may use one of your life lines.")
            print("your available life lines are")
            var count = 1
            for life in lifeLine{
                print("\(count)-" + life.description)
                count += 1
            }
            print("choose your life line by selecting 1 or 2 or 3")
            print("If you dont want to use the life line,enter NO or 4")
            var lifeLineChoosen = false
            if let userChoice = readLine(){
                var lifeLineIndex = 0
                if userChoice == "1"{
                    lifeLineIndex = 0
                }
                else if userChoice == "2"{
                    lifeLineIndex = 1
                }
                else if userChoice == "3"{
                    lifeLineIndex = 2
                }
                else if userChoice == "4" || userChoice == "NO"{
                    print("you have choosed option no life line")
                    print("let's get back into the game!!!")
                    print("\n")
                    startRounds()
                    return
                }
                if getLifeLine(index: lifeLineIndex) == .callFriend{
                    performCallAFriend()
                }
                if getLifeLine(index: lifeLineIndex) == .eliminateWrong{
                    performEliminateWrong()
                }
                if getLifeLine(index: lifeLineIndex) == .askAudience{
                    performAskAudience()
                }
                lifeLineChoosen = true
                //You already choosen a life line so remove the selected life line from array
                lifeLine.remove(at: lifeLineIndex)
            }
        }else{
            print("Yoou used all your life lines :(")
            print("You have 0 Life lines. Sorry.")
            print("So ..please answer the question below,without answering question you cannot go.")
            print("\n")
            startRounds()
        }
    }
    func getLifeLine(index:Int) -> LifeLine{
        return lifeLine[index]
    }
}

extension Game:LifeLines{
    func performCallAFriend() {
        print("you have chooses to call your friend for this question.")
        print("Enter your friend name that you are gonna call")
        let freindName = readLine()
        print("All right.Let's ask your \(freindName ?? "") friend.")
        print("\(freindName ?? "") you friend answer is")
        currentQuestion?.callphone()
        print("\n")
        if let answer = currentQuestion?.askForAnswer(gameMode ?? .easy){
            doValidation(answer)
        }
    }
    
    func performAskAudience() {
        
        print("you have chooses to ask audience for this question.")
        print("All right.Let's ask audience.")
        print("The resulst are")
        currentQuestion?.audiencePoll()
        print("\n")
        if let answer = currentQuestion?.askForAnswer(gameMode ?? .easy){
            doValidation(answer)
        }
    }
    
    func performEliminateWrong() {
        print("You have choosen to remove two wrong answers for this question.")
        print("All right. I am removing the two wrong answers.")
        print("Here we go")
        currentQuestion?.elimaterWrongAnswer()
        print("\n")
        
        //Again ask for answer
        if let answer = currentQuestion?.askForAnswer(gameMode ?? .easy){
            doValidation(answer)
        }
    }
}



