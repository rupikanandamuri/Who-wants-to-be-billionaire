//
//  Datasource.swift
//  projectKbc
//
//  Created by Rupika on 2020-03-11.
//  Copyright © 2020 Rupika. All rights reserved.
//

import Foundation

struct Datasource{
    
        
     var questions = [
           
        Question(title: "Which planet is nearest the sun?", questionNumber: 1, options: ["Mercury","Pluto","Venus","Mars"].shuffled(), answer: "Mercury"),
       Question(title: "How many eyes does a honeybee have?", questionNumber: 2, options: ["One","Two","Three","Five"].shuffled(), answer: "Five"),
       Question(title: "What is the lightest chemical element?", questionNumber: 3, options: ["Oxygen","Chromium","Hydrogen","Calcium"].shuffled(), answer: "Hydrogen"),
       Question(title: "What are three primary colors?", questionNumber: 4, options: ["RGB","YGB","BGA","VGA"].shuffled(), answer: "RGB"),
       Question(title: "Which natural substance is the hardest?", questionNumber: 5, options: ["Iron","Diamond","Steel","Platinum"].shuffled(), answer: "Diamond"),
       Question(title: "What is the largest vegetable?", questionNumber: 6, options: ["Pumpkin","Cabbage","Watermelon","Big Potato"].shuffled(), answer: "Cabbage"),
       Question(title: "Which fruit tree is considered to be sacred in India?", questionNumber: 7, options: ["Guava","Mango","Coconut","Banana"].shuffled(), answer: "Mango"),
       Question(title: "What is the noisiest city in the world?", questionNumber: 8, options: ["Hong Kong","Toronto","Berlin","Delhi"].shuffled(), answer: "Hong Kong"),
       Question(title: "What is the national animal of China?", questionNumber: 9, options: ["Panda","Panther","Bear","Dragon"].shuffled(), answer: "Panda"),
       Question(title: "How many time zones are there in the world?", questionNumber: 10, options: ["6","12","18","24"].shuffled(), answer: "24"),
       Question(title: "Which is the largest desert on earth?", questionNumber: 11, options: ["Sahara","Arabia","Chile","Mangolia"].shuffled(), answer: "Sahara"),
       Question(title: "What is the largest state of the United States?", questionNumber: 12, options: ["Alaska","California","Texas","Chicago"].shuffled(), answer: "Alaska"),
       Question(title: "What is the largest city in Canada?", questionNumber: 13, options: ["Brampton","Missisuaga","Toronto","Kitchener"].shuffled(), answer: "Toronto"),
       Question(title: "What is the fastest land animal?", questionNumber: 14, options: ["Cheetah","Panther","Deer","Rabbit"].shuffled(), answer: "Cheetah"),
       Question(title: "Which animal has green-colored fat?", questionNumber: 15, options: ["Tiger","Crocodile","Elephant","Rhino"].shuffled(), answer: "Crocodile"),
       Question(title: "What is the largest predator in the world?", questionNumber: 16, options: ["Elephant","Polar Bear","Lion","Wild Buffalo"].shuffled(), answer: "Polar Bear"),
       Question(title: "The largest animals on our planet?", questionNumber: 17, options: ["Giraffe","Blue whale","Elephant","Anaconda"].shuffled(), answer: "Blue whale"),
       Question(title: "The tallest trees in the world?", questionNumber: 18, options: ["Eucalyptus","Blueberry","Neem","Mango"].shuffled(), answer: "Eucalyptus"),
       Question(title: "What is the thinnest natural thread?", questionNumber: 19, options: ["Silk","SpiderWeb","Wool","Nylon"].shuffled(), answer: "SpiderWeb"),
       Question(title: "What animal has three hearts?", questionNumber: 20, options: ["Octopus","Fox","Honeybee","Snail"].shuffled(), answer: "Octopus")
           
       ].shuffled()
    
   //because of using mutating we can assigng temp array to question in struct becoz struct is value type we cannot assign normally buy using mutating we can achieve it
   mutating func refreshQuestionNo(){
       //to reassign question numbers
       var temp = [Question]()
    for (index,question) in questions.enumerated(){
          var q = question
          q.questionNumber = index + 1
          temp.append(q)
      }
       questions = temp
    }
}
