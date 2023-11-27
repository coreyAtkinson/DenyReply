//
//  viewQuiz.swift
//  DenyReply
//
//  Created by CATHERINE HUSEBY on 11/21/23.
//

import UIKit
// hi
class viewQuiz: UIViewController {
var score = 0
    @IBOutlet weak var a2Outlet: UIButton!
    @IBOutlet weak var a3Outlet: UIButton!
    @IBOutlet weak var scoreOutlet: UILabel!
    @IBOutlet weak var correctOutlet: UILabel!
    @IBOutlet weak var questionOutlet: UILabel!
    @IBOutlet weak var a1Outlet: UIButton!
    var rightAnswer = 0
    var questions = AppData.setofcardsets[AppData.index].cards
    var i = 0
   var randomAnswers = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
        questionOutlet.text = questions[i].question
         randomAnswers = [questions[i].answer, questions[Int.random(in: 0...questions.count - 1)].answer,questions[Int.random(in: 0...questions.count - 1)].answer]
      
        randomAnswers.shuffle()
        a1Outlet.titleLabel?.text = "\(randomAnswers[0])"
        a2Outlet.titleLabel?.text = "\(randomAnswers[1])"
        a3Outlet.titleLabel?.text = "\(randomAnswers[2])"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        if(i < questions.count - 1)
        {
            i = i + 1
            questionOutlet.text = questions[i].question
            randomAnswers = [questions[i].answer, questions[Int.random(in: 0...questions.count - 1)].answer,questions[Int.random(in: 0...questions.count - 1)].answer]
           randomAnswers.shuffle()
            if(randomAnswers[0] == questions[i].answer)
            {
                rightAnswer = 1
            }
            if(randomAnswers[1] == questions[i].answer)
            {
                rightAnswer = 2
            }
            if(randomAnswers[3] == questions[i].answer)
            {
                rightAnswer = 3
            }
           a1Outlet.titleLabel?.text = "\(randomAnswers[0])"
           a2Outlet.titleLabel?.text = "\(randomAnswers[1])"
           a3Outlet.titleLabel?.text = "\(randomAnswers[2])"
        }
        else{
            questionOutlet.text = "You completed the quiz! YAY"
            }
        
    }
    
    @IBAction func a1Action(_ sender: UIButton) {
        if(rightAnswer == 1)
        {
            correctOutlet.text = "correct!"
            score = score + 1
        }
        else
        {
            correctOutlet.text = "inncorect :("
        }
        
    }
    
    @IBAction func a2Action(_ sender: UIButton) {
        if(rightAnswer == 2)
        {
            correctOutlet.text = "correct!"
            score = score + 1
        }
        else
        {
            correctOutlet.text = "inncorect :("
        }
        
    }
    @IBAction func a3Action(_ sender: UIButton) {
        if(rightAnswer == 3)
        {
            correctOutlet.text = "correct!"
            score = score + 1
        }
        else
        {
            correctOutlet.text = "inncorect :("
        }
        
    }
    
}
