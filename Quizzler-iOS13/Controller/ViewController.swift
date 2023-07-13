//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  @IBOutlet weak var resetButton: UIButton!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var progressBar: UIProgressView!
  
  var correctAnswers = 0
  
  var quizBrain = QuizBrain()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    resetButton.isHidden = true
    updateUI()
  }

  @IBAction func resetQuestionary(_ sender: UIButton) {
    quizBrain.questionNumber = 0
    correctAnswers = 0
    resetButton.isHidden = true
    trueButton.isHidden = false
    falseButton.isHidden = false
    updateUI()
  }
  
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    let userAnswer = sender.currentTitle!
    let userGotItRight = quizBrain.checkAnswer(userAnswer)
    
    if userGotItRight{
      sender.backgroundColor = UIColor.green
    }else{
      sender.backgroundColor = UIColor.red
    }
    
    quizBrain.nextQuestion()
      
    Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
  }
  
  @objc func updateUI(){
  
    questionLabel.text = quizBrain.getQuestionText()
    trueButton.backgroundColor = UIColor.clear
    falseButton.backgroundColor = UIColor.clear
    
    let progress = quizBrain.getProgress()
    progressBar.setProgress(progress, animated: true)
    
  }
  
}
