//
//  main.swift
//  projectKbc
//
//  Created by Rupika on 2020-03-11.
//  Copyright © 2020 Rupika. All rights reserved.
//

import Foundation

var keepAskingForGame = true

while keepAskingForGame == true {
    
    print("Welcome to \"Who wants to be a millionare\" !")
    print("Enter you Name:")

    if let name = readLine(){
        let game:Game = Game(player: name)
        game.startGame()
        print("Do you want to play the game")
        print("Note you should enter YES/NO only in UPPER case only")
        print("Enter YES to play again or press NO to exit the game \(name)")
        var validChoice = false
        while validChoice == false {
            let continueGame = readLine()
            if continueGame == "YES"{
                print("Alright")
                validChoice = true
            }else if continueGame == "NO"{
                print("your are out of game")
                print("Thanks for playing the game!!")
                print("keep playing with us!!!")
                keepAskingForGame = false
                validChoice = true
            }else{
                print("Enter valid input either YES or NO in Upper case only")
                validChoice = false
            }
        }
        
    }
}
