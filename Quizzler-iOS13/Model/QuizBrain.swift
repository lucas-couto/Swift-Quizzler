//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Lucas Couto on 12/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain{
  let questions = [
    Question(text: "Is the Sun a star?", answer: "True"),
    Question(text: "Is the Moon larger than the Earth?", answer: "False"),
    Question(text: "Does water boil at 100°C?", answer: "True"),
    Question(text: "Is the Earth flat?", answer: "True"),
    Question(text: "Do humans need oxygen to survive?", answer: "True"),
    Question(text: "Does a year have 365 days?", answer: "True"),
    Question(text: "Is a banana a fruit?", answer: "True"),
    Question(text: "Is electricity a form of energy?", answer: "True"),
    Question(text: "Is a cat a pet?", answer: "True"),
    Question(text: "Does gravity make objects fall?", answer: "True"),
  ]
  
  var questionNumber = 0
  
  func checkAnswer(_ userAnswer: String) -> Bool{
    return userAnswer == questions[questionNumber].answer
  }
  
  func getQuestionText() -> String{
    return questions[questionNumber].text
  }
  
  func getProgress() -> Float{
    return Float(questionNumber + 1) / Float(questions.count)
  }
  
  mutating func nextQuestion(){
    if questionNumber != (questions.count - 1){
      questionNumber += 1
    }else{
      questionNumber = 0
    }
  }
  
  
}
